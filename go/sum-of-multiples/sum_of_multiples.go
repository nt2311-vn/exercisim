package summultiples

func SumMultiples(limit int, divisors ...int) int {
	setMap := map[int]bool{}
	setVal := make([]int, 0)

	for _, divisor := range divisors {
		if divisor == 0 {
			break
		}
		for i := divisor; i < limit; i += divisor {
			if !setMap[i] {
				setMap[i] = true
				setVal = append(setVal, i)
			}
		}
	}

	total := 0
	for _, num := range setVal {
		total += num
	}

	return total
}
