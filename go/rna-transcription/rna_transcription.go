package strand

func ToRNA(dna string) string {
	rnATran := ""

	dnaRune := []rune(dna)

	for _, v := range dnaRune {
		switch {
		case v == 'A':
			rnATran += "U"
		case v == 'T':
			rnATran += "A"
		case v == 'C':
			rnATran += "G"
		case v == 'G':
			rnATran += "C"
		}
	}

	return rnATran
}
