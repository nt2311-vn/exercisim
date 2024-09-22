package prime

import (
	"errors"
	"math"
)

// Nth returns the nth prime number. An error must be returned if the nth prime number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (int, error) {
	if n < 1 {
		return 0, errors.New("there is no prime")
	}

	if n == 1 {
		return 2, nil
	}
	count := 1
	num := 3

	for {

		isPrime := func(num int) bool {
			limit := int(math.Sqrt(float64(num)))
			for i := 2; i <= limit; i++ {
				if num%i == 0 {
					return false
				}
			}
			return true
		}(num)

		if isPrime {
			count++
		}

		if count == n {
			return num, nil
		}
		num += 2
	}
}
