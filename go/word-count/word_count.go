package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	re := regexp.MustCompile(`\b[\w|']+\b`)

	result := map[string]int{}

	wordArr := re.FindAllString(strings.ToLower(phrase), -1)

	if wordArr == nil {
		return result
	}

	for _, word := range wordArr {
		result[word] += 1
	}
	return result

	/*
		words := strings.Fields(strings.Trim(strings.ToLower(phrase), `\W`))
		result := map[string]int{}

		if words == nil {
			return result
		}

		for _, word := range words {
			result[word] += 1
		}
		return result
	*/
}
