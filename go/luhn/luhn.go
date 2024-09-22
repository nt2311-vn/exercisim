package luhn

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"
)

func Valid(id string) bool {
	if len(id) == 1 {
		return false
	}
	if id == " 0" {
		return false
	}
	checkValid := regexp.MustCompile(`\D`)
	haveWord := regexp.MustCompile(`(?i)[a-z]+|[-$#%]`)

	if haveWord.MatchString(id) {
		return false
	}
	validId := checkValid.ReplaceAllString(id, "")

	originalString := []byte(validId)

	reverseString := make([]byte, len(originalString))

	for i := range originalString {
		reverseString[i] = originalString[len(originalString)-1-i]
	}

	finalString := strings.Split(string(reverseString), "")

	luhnString := []int{}

	for i, v := range finalString {
		covertVal, err := strconv.Atoi(v)
		if err != nil {
			panic(err)
		}
		if i%2 == 0 {
			luhnString = append(luhnString, covertVal)
		} else {
			if covertVal*2 > 9 {
				luhnString = append(luhnString, covertVal*2-9)
			} else {
				luhnString = append(luhnString, covertVal*2)
			}
		}
	}

	count := 0
	fmt.Println(luhnString)

	for _, val := range luhnString {
		count += val
	}

	if count%10 == 0 {
		return true
	} else {
		return false
	}
}
