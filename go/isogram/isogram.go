package isogram

import (
	"regexp"
	"sort"
	"strings"
)

func IsIsogram(word string) bool {
	if len(word) == 1 {
		return true
	}

	regex := regexp.MustCompile(`\w`)
	onlyWord := regex.FindAllString(word, -1)
	sort.Strings(onlyWord)

	for i := 0; i < len(onlyWord)-1; i++ {
		if strings.ToLower(onlyWord[i]) == strings.ToLower(onlyWord[i+1]) {
			return false
		}
	}
	return true
}
