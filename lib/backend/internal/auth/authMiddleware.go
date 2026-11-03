package auth

import (
	"os"
	"strings"

	"github.com/gofiber/fiber/v3"
	"github.com/golang-jwt/jwt/v5"
)

const UserIdKey = "user_id"

func Middleware() fiber.Handler {
	return func(ctx fiber.Ctx) error {
		token, err := extractToken(ctx)
		if err != nil {
			return ctx.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
				"errorMessage": "unauthorized",
			})
		}
		secret := os.Getenv("JWT_SECRET")
		issuer := NewIssuer(secret)
		userId, err := issuer.ParseToken(token)
		if err != nil {
			return ctx.Status(fiber.StatusUnauthorized).JSON(fiber.Map{
				"errorMessage": "Invalid token",
			})
		}
		ctx.Locals(UserIdKey, userId)
		return ctx.Next()
	}
}

func extractToken(c fiber.Ctx) (string, error) {
	authHeader := c.Get("Authorization")
	if authHeader == "" {
		return "", jwt.ErrInvalidType
	}
	parts := strings.SplitN(authHeader, " ", 2)
	if !(len(parts) == 2 && parts[0] == "Bearer") {
		return "", jwt.ErrECDSAVerification
	}
	return parts[1], nil
}

func UserID(c fiber.Ctx) string {
	id, _ := c.Locals(UserIdKey).(string)
	return id
}
