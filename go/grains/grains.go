package grains

import (
	"errors"
	"math"
)

func Square(number int) (uint64, error) {
	if number <= 0 || number > 64 {
		return uint64(0), errors.New("square number must not negative")
	}
	return uint64(math.Pow(float64(2), float64(number-1))), nil
}

func Total() uint64 {
	totalVal := uint64(0)
	for square := 1; square < 65; square++ {
		totalVal += func() uint64 {
			currVal, err := Square(square)
			if err != nil {
				panic(err)
			}

			return currVal
		}()
	}
	return totalVal
}
