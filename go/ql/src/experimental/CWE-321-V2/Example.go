

var JwtKey = []byte("AllYourBase")

func main() {
	// BAD: usage of a harcoded Key 
	verifyJWT(token)
}

func LoadJwtKey(token *jwt.Token) (interface{}, error) {
	return JwtKey, nil
}
func verifyJWT(signedToken string) {
	fmt.Println("verifying JWT")
	DecodedToken, err := jwt.ParseWithClaims(signedToken, &CustomerInfo{}, LoadJwtKey)
	if claims, ok := DecodedToken.Claims.(*CustomerInfo); ok && DecodedToken.Valid {
		fmt.Printf("NAME:%v ,ID:%v\n", claims.Name, claims.ID)
	} else {
		log.Fatal(err)
	}
}