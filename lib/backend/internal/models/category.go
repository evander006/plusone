package models

type Category struct {
	Id        string    `json:"id" db:"id"`
	Title     string    `json:"title" db:"title"`
	Events []Event `json:"events" db:"events"`

}
