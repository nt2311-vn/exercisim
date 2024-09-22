package booking

import "time"

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	timeReturn, err := time.Parse("1/02/2006 15:04:05", date)
	if err != nil {
		panic(err)
	}
	return timeReturn
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	timeReturn, err := time.Parse("January 2, 2006 15:04:05", date)
	if err != nil {
		panic(err)
	}

	return timeReturn.Before(time.Now())
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	timeReturn, err := time.Parse("Monday, January 2, 2006 15:04:05", date)
	if err != nil {
		panic(err)
	}

	if timeReturn.Hour() >= 12 && timeReturn.Hour() < 18 {
		return true
	}
	return false
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	timeReturn, err := time.Parse("1/2/2006 15:04:05", date)
	if err != nil {
		panic(err)
	}

	return "You have an appointment on " + timeReturn.Format(
		"Monday, January 2, 2006, at 15:04",
	) + "."
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	timeReturn, err := time.Parse("2006-01-02", "2023-09-15")
	if err != nil {
		panic(err)
	}

	return timeReturn
}
