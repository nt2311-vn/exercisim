package lasagna

// TODO: define the 'PreparationTime()' function
func PreparationTime(layers []string, timetoCook int) int {
	if timetoCook == 0 {
		return len(layers) * 2
	}
	return len(layers) * timetoCook
}

// TODO: define the 'Quantities()' function
func Quantities(layers []string) (int, float64) {
	noodle := 0
	var sauce float64

	for _, ingredient := range layers {
		if ingredient == "noodles" {
			noodle = noodle + 50
		}
		if ingredient == "sauce" {
			sauce = sauce + 0.2
		}
	}

	return noodle, float64(sauce)
}

// TODO: define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendList []string, myList []string) {
	myList[len(myList)-1] = friendList[len(friendList)-1]
	return
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(fortwo []float64, portion int) []float64 {
	forscale := []float64{}
	for _, pertwo := range fortwo {
		forscale = append(forscale, pertwo*float64(portion)/2)
	}

	return forscale
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
