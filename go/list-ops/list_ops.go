package listops

// IntList is an abstraction of a list of integers which we can define methods on
type IntList []int

type (
	binFunc   func(x, y int) int
	predFunc  func(x int) bool
	unaryFunc func(x int) int
)

func (s IntList) Foldl(fn binFunc, initial int) int {
	for i := 0; i < len(s); i++ {
		initial = fn(initial, s[i])
	}

	return initial
}

func (s IntList) Foldr(fn binFunc, initial int) int {
	for i := len(s) - 1; i >= 0; i-- {
		initial = fn(s[i], initial)
	}

	return initial
}

func (s IntList) Filter(fn predFunc) IntList {
	filtered := make(IntList, 0)

	for _, num := range s {
		if fn(num) {
			filtered = append(filtered, num)
		}
	}

	return filtered
}

func (s IntList) Length() int {
	return len(s)
}

func (s IntList) Map(fn unaryFunc) IntList {
	mapped := make(IntList, 0)

	for _, num := range s {
		mapped = append(mapped, fn(num))
	}

	return mapped
}

func (s IntList) Reverse() IntList {
	reversed := make(IntList, 0)

	for i := len(s) - 1; i >= 0; i-- {
		reversed = append(reversed, s[i])
	}

	return reversed
}

func (s IntList) Append(lst IntList) IntList {
	appendList := make(IntList, 0)

	for _, num := range s {
		appendList = append(appendList, num)
	}

	for _, num := range lst {
		appendList = append(appendList, num)
	}

	return appendList
}

func (s IntList) Concat(lists []IntList) IntList {
	concatList := make(IntList, 0)

	for _, num := range s {
		concatList = append(concatList, num)
	}

	for _, list := range lists {
		for _, num := range list {
			concatList = append(concatList, num)
		}
	}

	return concatList
}
