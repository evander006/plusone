package models

import "time"

type Event struct {
	Id             string    `json:"id" db:"id"`
	OrganizationId string    `json:"organization_id" db:"organization_id"`
	Title          string    `json:"title" db:"title"`
	Description    string    `json:"description" db:"description"`
	StartsAt       time.Time `json:"starts_at" db:"starts_at"`
	Address        string    `json:"address" db:"address"`
	CategoryId     string    `json:"category_id" db:"category_id"`
	CreatedAt      time.Time `json:"created_at" db:"created_at"`
	Participants   []User    `json:"participants" gorm:"many2many:event_participants;"`
}
