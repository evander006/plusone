package models

import "time"

type Event struct {
	Id             string    `json:"id" db:"id"`
	OrganizationId string    `json:"organization_id" db:"organization_id"`
	Title          string    `json:"title" db:"title"`
	Description    string    `json:"description" db:"description"`
	StartsAt       time.Time `json:"starts_at" db:"starts_at"`
	Address        string    `json:"address" db:"address"`
	CreatedAt      time.Time `json:"created_at" db:"created_at"`
	Categories   []Category `json:"categories,omitempty" db:"-"`
    Participants []User     `json:"participants,omitempty" db:"-"`
}
