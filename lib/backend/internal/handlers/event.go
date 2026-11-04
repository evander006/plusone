package handlers

import (
	"context"
	"database/sql"
	"encoding/json"
	"plusone/internal/auth"
	"plusone/internal/dto"
	"plusone/internal/dto/events"
	"plusone/internal/models"
	"strings"
	"time"
	"github.com/google/uuid"

	"github.com/doug-martin/goqu/v9"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/log"
)

type EventApi struct {
	db *goqu.Database
}

func Event(con *sql.DB, app *fiber.App) {
	ea := EventApi{db: goqu.New("postgres", con)}
	app.Post("event/create", ea.create)
	app.Post("event/:id/join", auth.Middleware(), ea.join)
	app.Get("event/my", auth.Middleware(), ea.my)
}

// CreateEvent godoc
// @Summary Создать событие
// @Accept json
// @Produce json
// @Param request body dto.CreateEventRequest true "тело запроса"
// @Success 201
// @Failure 422
// @Failure 500
// @Router /event/create [post]
func (ea *EventApi) create(c fiber.Ctx) error {
	ctx, cancel := context.WithTimeout(c.Context(), 15*time.Second)
	defer cancel()

	var req events.CreateEventRequest
	if err := c.Bind().Body(&req); err != nil {
		return c.SendStatus(fiber.StatusUnprocessableEntity)
	}
	id := uuid.New().String()
	_, err := ea.db.Insert("events").Rows(goqu.Record{
		"id":              id,
		"title":           req.Title,
		"address":         req.Address,
		"category_id":     req.CategoryId,
		"created_at":      time.Now(),
		"starts_at":       req.StartsAt,
		"description":     req.Description,
		"organization_id": req.OrganizationId,
	}).Executor().ExecContext(ctx)
	if err != nil {
		out, _ := json.Marshal(dto.ErrorResponse{
			Message: err.Error(),
		})
		log.Error(string(out))
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	return c.Status(fiber.StatusCreated).JSON(fiber.Map{
		"id":    id,
		"added": true,
	})
}

// JoinEvent godoc
// @Summary Присоединиться к событию
// @Security Bearer
// @Accept json
// @Produce json
// @Param id path string true "id события"
// @Success 201
// @Failure 401
// @Failure 500
// @Router /event/{id}/join [post]
func (ea *EventApi) join(c fiber.Ctx) error {
	userId := auth.UserID(c)
	eventId := c.Params("id")

	_, err := ea.db.Insert("event_participants").Rows(goqu.Record{
		"user_id":  userId,
		"event_id": eventId,
	}).Executor().ExecContext(c.Context())
	if err != nil {
		if strings.Contains(err.Error(), "duplicate key") || strings.Contains(err.Error(), "unique constraint") {
			return c.Status(fiber.StatusOK).JSON(fiber.Map{
				"joined":  true,
				"already": true,
			})
		}
		out, _ := json.Marshal(dto.ErrorResponse{
			Message: err.Error(),
		})
		log.Error(string(out))
		return c.Status(fiber.StatusInternalServerError).JSON(dto.ErrorResponse{Message: err.Error()})
	}
	return c.Status(fiber.StatusCreated).JSON(fiber.Map{
		"joined": true,
	})
}

// MyEvents godoc
// @Summary Мои события
// @Security Bearer
// @Produce json
// @Success 200 {array} models.Event
// @Failure 401
// @Failure 500
// @Router /event/my [get]
func (ea *EventApi) my(c fiber.Ctx) error {
	userId := auth.UserID(c)
	var eventsArr []models.Event

	err := ea.db.From("events").
		Join(goqu.T("event_participants"),
			goqu.On(goqu.I("events.id").Eq(goqu.I("event_participants.event_id")))).
		Where(goqu.I("event_participants.user_id").Eq(userId)).
		ScanStructsContext(c.Context(), &eventsArr)
	if err != nil {
		out, _ := json.Marshal(dto.ErrorResponse{
			Message: err.Error(),
		})
		log.Error(string(out))
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	return c.JSON(eventsArr)
}
