package parsinglogfiles

import (
	"fmt"
	"regexp"
)

func IsValidLine(text string) bool {
	logModel := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`)
	findIndex := logModel.FindStringIndex(text)
	if findIndex == nil {
		return false
	}
	return true
}

func SplitLogLine(text string) []string {
	specDeli := regexp.MustCompile(`<[-~*=]*>`)
	splitSring := specDeli.Split(text, -1)
	return splitSring
}

func CountQuotedPasswords(lines []string) int {
	matchPass := regexp.MustCompile(`(?i)".*password.*"`)
	count := 0
	for _, str := range lines {
		if matchPass.MatchString(str) {
			count++
		}
	}
	return count
}

func RemoveEndOfLineText(text string) string {
	re := regexp.MustCompile(`end-of-line\d*`)
	return re.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	re := regexp.MustCompile(`User\s+(\w+)`)
	ret := []string{}
	for _, line := range lines {
		founds := re.FindStringSubmatch(line)
		if founds != nil {
			line = fmt.Sprintf("[USR] %s %s", founds[1], line)
		}
		ret = append(ret, line)
	}
	return ret
}
