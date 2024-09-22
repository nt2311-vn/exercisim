package thefarm

import (
	"errors"
	"fmt"
)

type InvalidCowsError struct {
	cows int
	msg  string
}

// TODO: define the 'DivideFood' function
func DivideFood(f FodderCalculator, cows int) (float64, error) {
	amt, err := f.FodderAmount(cows)
	if err != nil {
		return 0, err
	}

	factor, err := f.FatteningFactor()
	if err != nil {
		return 0, err
	}

	return amt / float64(cows) * factor, nil
}

// TODO: define the 'ValidateInputAndDivideFood' function
func ValidateInputAndDivideFood(f FodderCalculator, cows int) (float64, error) {
	if cows <= 0 {
		return 0, errors.New("invalid number of cows")
	}

	return DivideFood(f, cows)
}

// TODO: define the 'ValidateNumberOfCows' function

func (e *InvalidCowsError) Error() string {
	return fmt.Sprintf("%s", e.msg)
}

func ValidateNumberOfCows(cows int) error {
	if cows < 0 {
		return &InvalidCowsError{
			msg: fmt.Sprintf("%d cows are invalid: there are no negative cows", cows),
		}
	}

	if cows == 0 {
		return &InvalidCowsError{
			msg: fmt.Sprintf("%d cows are invalid: no cows don't need food", cows),
		}
	}
	return nil
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
