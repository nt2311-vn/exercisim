package protein

import (
	"errors"
)

var (
	ErrInvalidBase = errors.New("invalid base")
	ErrStop        = errors.New("stop")
)

var rnaTranscript = map[string]string{
	"AUG": "Methionine",
	"UUU": "Phenylalanine",
	"UUC": "Phenylalanine",
	"UUA": "Leucine",
	"UUG": "Leucine",
	"UCU": "Serine",
	"UCC": "Serine",
	"UCA": "Serine",
	"UCG": "Serine",
	"UAU": "Tyrosine",
	"UAC": "Tyrosine",
	"UGU": "Cysteine",
	"UGC": "Cysteine",
	"UGG": "Tryptophan",
	"UAA": "STOP",
	"UAG": "STOP",
	"UGA": "STOP",
}

func FromRNA(rna string) ([]string, error) {
	rnaStr := []string{}

	if len(rna)%3 != 0 {
		return rnaStr, ErrInvalidBase
	}

	for i := 0; i < len(rna); i += 3 {
		rnaVal, rnaExist := rnaTranscript[rna[i:i+3]]

		if !rnaExist {
			return rnaStr, ErrInvalidBase
		}
		if rnaVal == "STOP" {
			break
		}
		rnaStr = append(rnaStr, rnaVal)
	}
	return rnaStr, nil
}

func FromCodon(codon string) (string, error) {
	rnaVal, rnaExist := rnaTranscript[codon]

	if !rnaExist {
		return "", ErrInvalidBase
	}

	if rnaVal == "STOP" {
		return "", ErrStop
	}

	return rnaVal, nil
}
