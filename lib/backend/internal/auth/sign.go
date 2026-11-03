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

func (i Issuer) ParseToken(tokenStr string) (string, error) {
	token, err := jwt.ParseWithClaims(tokenStr, &jwt.RegisteredClaims{}, func(t *jwt.Token) (any, error) {
		if t.Method != jwt.SigningMethodHS256 {
			return nil, jwt.ErrTokenSignatureInvalid
		}
		return i.secret, nil
	})
	if err != nil {
		return "", err
	}
	claims, ok := token.Claims.(*jwt.RegisteredClaims)
	if !ok || !token.Valid || claims.Subject == "" {
		return "", jwt.ErrTokenInvalidClaims
	}
	return claims.Subject, nil
}
