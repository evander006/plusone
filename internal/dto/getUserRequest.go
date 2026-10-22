package dto

type GetUserRequest struct {
	Email        string `json:"email"`
	PasswordHash string `json:"password_hash"`
}
