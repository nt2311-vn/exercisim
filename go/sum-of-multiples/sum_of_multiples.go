package summultiples

func SumMultiples(limit int, divisors ...int) int {
	setMap := map[int]bool{}

	for _, divisor := range divisors {
		if divisor == 0 {
			break
		}
		for i := divisor; i < limit; i += divisor {
			if !setMap[i] {
				setMap[i] = true
			}
		}
	}

	total := 0
	for k := range setMap {
		total += k
	}

	return total
}
