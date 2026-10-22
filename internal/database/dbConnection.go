package database

import (
	"database/sql"
	"fmt"
	"log"
	"plusone/internal/config"

	_ "github.com/lib/pq"
)

func SetConnection(cnf config.Database) (*sql.DB, error) {
	connect := fmt.Sprintf("host=%s port=%s user=%s dbname=%s password=%s sslmode=disable", cnf.Host, cnf.Port, cnf.User, cnf.Name, cnf.Password)
	connection, err := sql.Open("postgres", connect)
	if err != nil {
		log.Fatal(err)
	}
	if err := connection.Ping(); err != nil {
		log.Fatal(err)
	}
	return connection, err
}
