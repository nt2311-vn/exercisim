package resistorcolorduo

import "strconv"

// Value should return the resistance value of a resistor with a given colors.
var colorMap = map[string]string{
	"black":  "0",
	"brown":  "1",
	"red":    "2",
	"orange": "3",
	"yellow": "4",
	"green":  "5",
	"blue":   "6",
	"violet": "7",
	"grey":   "8",
	"white":  "9",
}

func Value(colors []string) int {
	strNum := ""
	for _, color := range colors[0:2] {
		colorVal, colorExist := colorMap[color]

		if colorExist {
			strNum += colorVal
		}
	}

	result, err := strconv.Atoi(strNum)
	if err != nil {
		panic(err)
	}
	return result
}
