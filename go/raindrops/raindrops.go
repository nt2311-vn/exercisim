package raindrops

import "strconv"

func Convert(number int) string {
	rainString := ""

	if number%3 != 0 && number%5 != 0 && number%7 != 0 {
		return strconv.Itoa(number)
	}
	if number%3 == 0 {
		rainString += "Pling"
	}

	if number%5 == 0 {
		rainString += "Plang"
	}

	if number%7 == 0 {
		rainString += "Plong"
	}
	return rainString
}
