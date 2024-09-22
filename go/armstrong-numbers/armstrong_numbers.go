package armstrong

import (
	"math"
	"strconv"
	"strings"
)

func IsNumber(n int) bool {
	strNum := strconv.Itoa(n)

	toSum := 0
	for _, num := range strings.Split(strNum, "") {
		convNum, err := strconv.Atoi(num)
		if err != nil {
			panic(err)
		}

		toSum += int(math.Pow(float64(convNum), float64(len(strNum))))
	}

	if n == toSum {
		return true
	}
	return false
}
