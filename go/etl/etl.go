package etl

import (
	"sort"
	"strings"
)

func Transform(in map[int][]string) map[string]int {
	keys := []int{}
	result := map[string]int{}

	for k := range in {
		keys = append(keys, k)
	}

	sort.Ints(keys)

	for _, k := range keys {
		for _, char := range in[k] {
			result[strings.ToLower(char)] = k
		}
	}
	return result
}
