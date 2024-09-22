package rotationalcipher

import (
	"strings"
	"unicode"
)

func RotationalCipher(plain string, shiftKey int) string {
	charStr := []rune(plain)
	alphabeltStr := "abcdefghijklmnopqrstuvwxyz"
	result := ""

	for _, c := range charStr {
		posCurr := strings.Index(alphabeltStr, strings.ToLower(string(c)))

		if posCurr >= 0 {
			if unicode.IsUpper(c) {
				result += strings.ToUpper(string(alphabeltStr[(posCurr+shiftKey)%26]))
			} else {
				result += string(alphabeltStr[(posCurr+shiftKey)%26])
			}
		} else {
			result += string(c)
		}
	}
	return result
}
