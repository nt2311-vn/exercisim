package reverse

func Reverse(input string) string {
	runeChar := []rune(input)

	for i, j := 0, len(runeChar)-1; i < j; i, j = i+1, j-1 {
		runeChar[i], runeChar[j] = runeChar[j], runeChar[i]
	}

	return string(runeChar)
}
