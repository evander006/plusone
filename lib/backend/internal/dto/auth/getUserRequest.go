package auth

type GetUserRequest struct {
	Email    string `json:"email"`
	PasswordHash string `json:"password"`
}
