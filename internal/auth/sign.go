package auth

import (
	"time"

	"github.com/golang-jwt/jwt/v5"
)

type Issuer struct {
	secret []byte
	ttl    time.Duration
}

func NewIssuer(secret string) Issuer {
	return Issuer{
		secret: []byte(secret),
		ttl:    15 * time.Minute,
	}
}

func (i Issuer) SignToken(userId string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.RegisteredClaims{
		ExpiresAt: jwt.NewNumericDate(time.Now().Add(i.ttl)),
		Subject:   userId,
	})
	return token.SignedString(i.secret)
}
