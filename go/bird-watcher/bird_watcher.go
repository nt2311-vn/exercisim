package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) int {
	totalBirdCount := 0
	for _, birdCount := range birdsPerDay {
		totalBirdCount += birdCount
	}
	return totalBirdCount
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	totalWeek := 0
	for i := (week - 1) * 7; i < (week-1)*7+7; i++ {
		totalWeek += birdsPerDay[i]
	}
	return totalWeek
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i < len(birdsPerDay); i = i + 2 {
		birdsPerDay[i] = birdsPerDay[i] + 1
	}
	return birdsPerDay
}
