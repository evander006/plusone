package dto

type CreateUserRequest struct {
	Email        string `json:"email"`
	DisplayName  string `json:"display_name"`
	City         string `json:"city"`
	PasswordHash string `json:"password_hash"`
}
