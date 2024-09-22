package scrabble

import (
	"regexp"
	"strings"
)

func Score(word string) int {
	count := 0

	runeS := strings.Split(word, "")

	onePoint := regexp.MustCompile(`(?i)[AEIOULNRST]`)
	twoPoint := regexp.MustCompile(`(?i)[DG]`)
	threePoint := regexp.MustCompile(`(?i)[BCMP]`)
	fourPoint := regexp.MustCompile(`(?i)[FHVWY]`)
	fivePoint := regexp.MustCompile(`(?i)[K]`)
	eightPoint := regexp.MustCompile(`(?i)[JX]`)
	tenPoint := regexp.MustCompile(`(?i)[QZ]`)

	for _, char := range runeS {
		if onePoint.MatchString(char) {
			count += 1
		}
		if twoPoint.MatchString(char) {
			count += 2
		}

		if threePoint.MatchString(char) {
			count += 3
		}

		if fourPoint.MatchString(char) {
			count += 4
		}

		if fivePoint.MatchString(char) {
			count += 5
		}

		if eightPoint.MatchString(char) {
			count += 8
		}

		if tenPoint.MatchString(char) {
			count += 10
		}

	}
	return count
}
