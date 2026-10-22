package main

import (
	swaggo "github.com/gofiber/contrib/v3/swaggo"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/log"

	_ "plusone/doca"
	"plusone/internal/config"
	"plusone/internal/database"
	"plusone/internal/handlers"
)

// @title Plusone API
// @version 1
// @host localhost:9000
// @BasePath /
func main() {
	cnf, _ := config.Get()
	dbCon, _ := database.SetConnection(cnf.Database)
	app := fiber.New()
	handlers.UserAuth(dbCon, app)
	app.Get("/swagger/*", swaggo.HandlerDefault)
	err := app.Listen(":9000")
	if err != nil {
		log.Fatal(err)
	}
}
