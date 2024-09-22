package atbash

import (
	"strings"
	"unicode"
)

func Atbash(s string) string {
	alphabeltStr := "abcdefghijklmnopqrstuvwxyz"
	result := ""
	runeStr := []rune(s)
	for _, c := range runeStr {
		if unicode.IsLetter(c) {
			charPos := strings.Index(alphabeltStr, strings.ToLower(string(c)))
			result += string(alphabeltStr[25-charPos])

		} else if unicode.IsDigit(c) {
			result += string(c)
		}

		if len(result)%6 == 5 {
			result += " "
		}
	}

	return strings.TrimSuffix(result, " ")
}
