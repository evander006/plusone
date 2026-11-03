package main

import (
	"os"
	_ "plusone/doca"
	"plusone/internal/config"
	"plusone/internal/database"
	"plusone/internal/handlers"

	"github.com/gofiber/contrib/v3/swaggo"
	"github.com/gofiber/fiber/v3"
	"github.com/gofiber/fiber/v3/log"
)

// @title Plusone API
// @version 1
// @host localhost:9000
// @BasePath /
// @securityDefinitions.apikey Bearer
// @in header
// @name Authorization
// @description Bearer {token}
func main() {
	cnf := config.Get()
	dbCon, _ := database.SetConnection(cnf.Database)
	app := fiber.New()
	handlers.UserAuth(dbCon, app)
	handlers.Event(dbCon, app)
	app.Get("/swagger/*", swaggo.HandlerDefault)
	port := os.Getenv("PORT")
	if port == "" {
		port = "9000"
	}
	err := app.Listen(":" + port)
	if err != nil {
		log.Fatal(err)
	}

}

//func main() {
//	http.HandleFunc("/", myMiddleware(myHandler))
//	http.ListenAndServe(":8080", nil)
//}
//
//func myHandler(writer http.ResponseWriter, request *http.Request) {
//	log.Info("Hi")
//	writer.WriteHeader(http.StatusOK)
//}
//func myMiddleware(next http.HandlerFunc) http.HandlerFunc {
//	return func(writer http.ResponseWriter, request *http.Request) {
//		log.Info("token auth middleware")
//		next(writer, request)
//	}
//}
