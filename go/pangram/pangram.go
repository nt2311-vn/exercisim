package pangram

import (
	"strings"
	"unicode"
)

func IsPangram(input string) bool {
	// Convert the string to lowercase for case-insensitivity
	lowercaseInput := strings.ToLower(input)

	// Create a map to track the presence of each alphabet letter
	alphabetMap := make(map[rune]bool)

	// Iterate over each character in the lowercase string
	for _, char := range lowercaseInput {
		// Check if the character is an alphabet letter
		if unicode.IsLetter(char) {
			alphabetMap[char] = true
		}
	}

	// Check if the map contains all 26 alphabet letters
	return len(alphabetMap) == 26
}
