package events

import "time"

type CreateEventRequest struct {
	Title          string    `json:"title"`
	Address        string    `json:"address"`
	CategoryId     string    `json:"category_id"`
	StartsAt       time.Time `json:"starts_at"`
	Description    string    `json:"description"`
	OrganizationId string    `json:"organization_id"`
}
