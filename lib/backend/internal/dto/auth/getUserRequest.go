package auth

type GetUserRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}
