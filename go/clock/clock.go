package clock

import "fmt"

// Define the Clock type here.
type Clock struct {
	h int
	m int
}

func New(h, m int) Clock {
	min := m
	hour := h

	hour += int(m / 60)

	if m%60 < 0 {
		hour--
		min = m%60 + 60

	} else {
		min = m % 60
	}

	if hour%24 < 0 {
		hour = hour%24 + 24
	} else {
		hour = hour % 24
	}

	return Clock{h: hour, m: min}
}

func (c Clock) Add(m int) Clock {
	hour := c.h
	min := c.m

	min += m

	hour += int(min / 60)

	if min%60 < 0 {
		hour--
		min = min%60 + 60

	} else {
		min = min % 60
	}

	if hour%24 < 0 {
		hour = hour%24 + 24
	} else {
		hour = hour % 24
	}

	return Clock{h: hour, m: min}
}

func (c Clock) Subtract(m int) Clock {
	hour := c.h
	min := c.m

	min -= m

	hour += int(min / 60)

	if min%60 < 0 {
		hour--
		min = min%60 + 60

	} else {
		min = min % 60
	}

	if hour%24 < 0 {
		hour = hour%24 + 24
	} else {
		hour = hour % 24
	}

	return Clock{h: hour, m: min}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.h, c.m)
}
