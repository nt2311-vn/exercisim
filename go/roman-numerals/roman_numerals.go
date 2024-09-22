package romannumerals

import "errors"

func ToRomanNumeral(input int) (string, error) {
	if input <= 0 || input > 3999 {
		return "Cannot display", errors.New("Out of bound arguments")
	}

	/*
		romanStr := ""


			for input > 0 {
				for int(input/1000) > 0 {
					romanStr += "M"
					input -= 1000
				}
				for int(input/900) > 0 {
					romanStr += "CM"
					input -= 900
				}

				for int(input/800) > 0 {
					romanStr += "DCCC"
					input -= 800
				}

				for int(input/700) > 0 {
					romanStr += "DCC"
					input -= 700
				}

				for int(input/600) > 0 {
					romanStr += "DC"
					input -= 600
				}

				for int(input/500) > 0 {
					romanStr += "D"
					input -= 500
				}

				for int(input/400) > 0 {
					romanStr += "CD"
					input -= 400
				}

				for int(input/300) > 0 {
					romanStr += "CCC"
					input -= 300
				}

				for int(input/200) > 0 {
					romanStr += "CC"
					input -= 200
				}

				for int(input/100) > 0 {
					romanStr += "C"
					input -= 100
				}

				for int(input/90) > 0 {
					romanStr += "XC"
					input -= 90
				}

				for int(input/80) > 0 {
					romanStr += "LXXX"
					input -= 80
				}

				for int(input/70) > 0 {
					romanStr += "LXX"
					input -= 70
				}

				for int(input/60) > 0 {
					romanStr += "LX"
					input -= 60
				}

				for int(input/50) > 0 {
					romanStr += "L"
					input -= 50
				}

				for int(input/40) > 0 {
					romanStr += "XL"
					input -= 40
				}

				for int(input/30) > 0 {
					romanStr += "XXX"
					input -= 30
				}

				for int(input/20) > 0 {
					romanStr += "XX"
					input -= 20
				}

				for int(input/10) > 0 {
					romanStr += "X"
					input -= 10
				}

				for int(input/9) > 0 {
					romanStr += "IX"
					input -= 9
				}

				for int(input/8) > 0 {
					romanStr += "VIII"
					input -= 8
				}

				for int(input/7) > 0 {
					romanStr += "VII"
					input -= 7
				}

				for int(input/6) > 0 {
					romanStr += "VI"
					input -= 6
				}

				for int(input/5) > 0 {
					romanStr += "V"
					input -= 5
				}

				for int(input/4) > 0 {
					romanStr += "IV"
					input -= 4
				}

				for int(input/3) > 0 {
					romanStr += "III"
					input -= 3
				}

				for int(input/2) > 0 {
					romanStr += "II"
					input -= 2
				}

				for input > 0 {
					romanStr += "I"
					input--
				}
			}
			return romanStr, nil
	*/

	romanCiphers := []struct {
		value  int
		symbol string
	}{
		{1000, "M"},
		{900, "CM"},
		{500, "D"},
		{400, "CD"},
		{100, "C"},
		{90, "XC"},
		{50, "L"},
		{40, "XL"},
		{10, "X"},
		{9, "IX"},
		{5, "V"},
		{4, "IV"},
		{1, "I"},
	}

	romanStr := ""

	for _, pair := range romanCiphers {
		for input >= pair.value {
			romanStr += pair.symbol
			input -= pair.value
		}
	}

	return romanStr, nil
}
