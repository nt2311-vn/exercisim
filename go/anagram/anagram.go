package anagram

import (
	"strings"
)

func Detect(subject string, candidates []string) []string {
	result := []string{}
	for _, word := range candidates {

		isAnagram := func(word1, word2 string) bool {
			if len(word1) != len(word2) {
				return false
			}

			if strings.ToLower(word1) == strings.ToLower(word2) {
				return false
			}

			uniqueChar := make(map[rune]int)

			for _, char := range strings.ToLower(word1) {
				uniqueChar[char]++
			}

			for _, char := range strings.ToLower(word2) {
				uniqueChar[char]--

				if uniqueChar[char] < 0 {
					return false
				}

			}

			return true
		}(subject, word)

		if isAnagram {
			result = append(result, word)
		}
	}
	return result
}
