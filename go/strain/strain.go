package strain

// Implement the "Keep" and "Discard" function in this file.

// You will need typed parameters (aka "Generics") to solve this exercise.
// They are not part of the Exercism syllabus yet but you can learn about
// them here: https://go.dev/tour/generics/1

func Keep[T any](in []T, f func(x T) bool) []T {
	keep := []T{}

	for _, v := range in {
		if f(v) {
			keep = append(keep, v)
		}
	}
	return keep
}

func Discard[T any](in []T, f func(x T) bool) []T {
	discard := []T{}

	for _, v := range in {
		if !f(v) {
			discard = append(discard, v)
		}
	}
	return discard
}
