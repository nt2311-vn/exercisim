package isbn

import "strings"

func IsValidISBN(isbn string) bool {
	isbn = strings.Replace(isbn, "-", "", -1)
	if len(isbn) != 10 {
		return false
	}
	var sum int
	for i := 0; i < 10; i++ {
		digit := isbn[i]
		if i == 9 && digit == 'X' {
			sum += 10
			continue
		}
		if digit < '0' || digit > '9' {
			return false
		}
		sum += (10 - i) * int(digit-'0')
	}
	return sum%11 == 0
}
