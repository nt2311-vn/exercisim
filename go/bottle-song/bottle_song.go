package bottlesong

import (
	"fmt"
	"strings"
)

func Recite(startBottles, takeDown int) []string {
	recite := []string{}
	currBottle := startBottles
	bottleStr := func(bottle int) string {
		if bottle == 1 {
			return "bottle"
		} else {
			return "bottles"
		}
	}

	numberStr := func(bottle int) string {
		switch bottle {
		case 10:
			return "Ten"
		case 9:
			return "Nine"
		case 8:
			return "Eight"
		case 7:
			return "Seven"
		case 6:
			return "Six"
		case 5:
			return "Five"
		case 4:
			return "Four"
		case 3:
			return "Three"
		case 2:
			return "Two"
		case 1:
			return "One"
		default:
			return "no"
		}
	}

	for i := 0; i < takeDown; i++ {
		recite = append(
			recite,
			fmt.Sprintf(
				"%s green %s hanging on the wall,",
				numberStr(currBottle),
				bottleStr(currBottle),
			),
		)
		recite = append(
			recite,
			fmt.Sprintf(
				"%s green %s hanging on the wall,",
				numberStr(currBottle),
				bottleStr(currBottle),
			),
		)
		recite = append(recite, "And if one green bottle should accidentally fall,")
		currBottle--
		recite = append(
			recite,
			fmt.Sprintf(
				"There'll be %s green %s hanging on the wall.",
				strings.ToLower(numberStr(currBottle)),
				bottleStr(currBottle),
			),
		)
		if i != takeDown-1 {
			recite = append(recite, "")
		}
	}

	return recite
}
