package partyrobot

import "fmt"

// Welcome greets a person by name.
func Welcome(name string) string {
	return fmt.Sprintf("Welcome to my party, %s!", name)
}

// HappyBirthday wishes happy birthday to the birthday person and exclaims their age.
func HappyBirthday(name string, age int) string {
	return fmt.Sprintf("Happy birthday %s! You are now %d years old!", name, age)
}

// AssignTable assigns a table to each guest.
func AssignTable(name string, table int, neighbor, direction string, distance float64) string {
	if table > 0 && table < 10 {
		return fmt.Sprintf(
			"Welcome to my party, %s!\nYou have been assigned to table 00%d. Your table is %s, exactly %.1f meters from here.\nYou will be sitting next to %s.",
			name,
			table,
			direction,
			distance,
			neighbor,
		)
	}
	if table >= 10 && table < 100 {
		return fmt.Sprintf(
			"Welcome to my party, %s!\nYou have been assigned to table 0%d. Your table is %s, exactly %.1f meters from here.\nYou will be sitting next to %s.",
			name,
			table,
			direction,
			distance,
			neighbor,
		)
	}

	return fmt.Sprintf(
		"Welcome to my party, %s!\nYou have been assigned to table %d. Your table is %s, exactly %.1f meters from here.\nYou will be sitting next to %s.",
		name,
		table,
		direction,
		distance,
		neighbor,
	)
}
