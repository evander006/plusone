package handlers

import (
	"context"
	"database/sql"
	"encoding/json"
	"os"
	"plusone/internal/auth"
	"plusone/internal/dto"
	"plusone/internal/models"
	"time"
	"uuid"

	"github.com/doug-martin/goqu/v9"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/log"
	"golang.org/x/crypto/bcrypt"
)

type UserApi struct {
	db *goqu.Database
}

func UserAuth(con *sql.DB, app *fiber.App) {
	ua := UserApi{db: goqu.New("postgres", con)}

	app.Post("user/create", ua.create)
	app.Post("user/auth", ua.auth)
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
	hashedPass, err := bcrypt.GenerateFromPassword([]byte(req.PasswordHash), bcrypt.DefaultCost)
	if err != nil {
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	id := uuid.New().String()

	_, err = u.db.Insert("users").Rows(goqu.Record{
		"id":            id,
		"display_name":  req.DisplayName,
		"email":         req.Email,
		"city":          req.City,
		"password_hash": string(hashedPass),
		"created_at":    time.Now(),
	}).Executor().ExecContext(ctx)
	if err != nil {
		out, _ := json.Marshal(dto.ErrorResponse{
			Message: err.Error(),
		})
		log.Error(string(out))
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	issuer := auth.NewIssuer(os.Getenv("JWT_SECRET"))
	token, err := issuer.SignToken(id)
	if err != nil {
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	return c.Status(fiber.StatusCreated).JSON(fiber.Map{
		"access_token": token,
	})
}

// GetUser godoc
// @Summary Аутентификация пользователя
// @Accept json
// @Produce json
// @Param request body dto.GetUserRequest true "тело запроса"
// @Success 200
// @Failure 422
// @Failure 500
// @Router /user/auth [post]
func (u *UserApi) auth(c fiber.Ctx) error {
	ctx, cancel := context.WithTimeout(c.Context(), 15*time.Second)
	defer cancel()
	var user models.User
	var req dto.GetUserRequest
	if err := c.Bind().Body(&req); err != nil {
		log.Error(err.Error())
		return c.SendStatus(fiber.StatusUnprocessableEntity)
	}
	found, err := u.db.From("users").Select("id", "email", "display_name", "city", "password_hash", "created_at").
		Where(goqu.L("lower(email)=lower(?)", req.Email)).
		Executor().ScanStructContext(ctx, &user)
	if err != nil {
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	if !found || bcrypt.CompareHashAndPassword([]byte(user.PasswordHash), []byte(req.PasswordHash)) != nil {
		c.SendStatus(fiber.StatusUnauthorized)
	}
	return c.SendStatus(fiber.StatusOK)
}
