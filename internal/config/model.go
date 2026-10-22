package config

type Database struct {
	Name     string
	Host     string
	User     string
	Password string
	Port     string
}
type Config struct {
	Database Database
}
