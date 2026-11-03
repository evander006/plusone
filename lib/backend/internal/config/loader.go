package config

import (
	"os"

	"github.com/joho/godotenv"
)

func Get() Config {
	_ = godotenv.Load() // local .env; on Render env vars come from dashboard

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
