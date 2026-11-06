package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

func Get() Config {
	env:=os.Getenv("APP_ENV")
	if env=="dev" || env=="" {
		if err:= godotenv.Load("internal/config/.env.dev"); err!=nil{
			log.Println("Development .env not found, using system environment")
		}
	}

	sslMode := os.Getenv("PG_SSLMODE")
	if sslMode == "" {
		sslMode = "disable"
	}

	return Config{
		Database: Database{
			Name:     os.Getenv("PG_DB"),
			Host:     os.Getenv("PG_HOST"),
			User:     os.Getenv("PG_USER"),
			Password: os.Getenv("PG_PASSWORD"),
			Port:     os.Getenv("PG_PORT"),
			SSLMode:  sslMode,
		},
	}
}
