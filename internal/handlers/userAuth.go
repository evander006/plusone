package handlers

import (
	"context"
	"database/sql"
	"encoding/json"
	"plusone/internal/dto"
	"time"
	"uuid"

	"github.com/doug-martin/goqu/v9"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/log"
)

type UserApi struct {
	db *goqu.Database
}

func UserAuth(con *sql.DB, app *fiber.App) {
	ua := UserApi{db: goqu.New("postgres", con)}

	app.Post("user/create", ua.create)
}

// CreateUser godoc
// @Summary Создать пользователя
// @Accept json
// @Produce json
// @Param request body dto.CreateUserRequest true "тело запроса"
// @Success 201
// @Failure 422
// @Failure 500
// @Router /user/create [post]
func (u *UserApi) create(c fiber.Ctx) error {
	ctx, cancel := context.WithTimeout(c.Context(), 15*time.Second)
	defer cancel()

	var req dto.CreateUserRequest
	if err := c.Bind().Body(&req); err != nil {
		return c.SendStatus(fiber.StatusUnprocessableEntity)
	}
	_, err := u.db.Insert("users").Rows(goqu.Record{
		"id":            uuid.New().String(),
		"display_name":  req.DisplayName,
		"email":         req.Email,
		"city":          req.City,
		"password_hash": req.PasswordHash,
		"created_at":    time.Now(),
	}).Executor().ExecContext(ctx)
	if err != nil {
		out, _ := json.Marshal(dto.ErrorResponse{
			Message: err.Error(),
		})
		log.Error(string(out))
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	return c.SendStatus(fiber.StatusCreated)
}
