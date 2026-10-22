package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

func Get() (Config, error) {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
	return Config{
		Database: Database{
			Name:     os.Getenv("PG_DB"),
			Host:     os.Getenv("PG_HOST"),
			User:     os.Getenv("PG_USER"),
			Password: os.Getenv("PG_PASSWORD"),
			Port:     os.Getenv("PG_PORT"),
		},
	}, err
}
