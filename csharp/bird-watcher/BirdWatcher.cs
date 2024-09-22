using System;

class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek() => new int[] { 0, 2, 5, 3, 7, 8, 4 };

    public int Today() => birdsPerDay[birdsPerDay.Length - 1];

    public void IncrementTodaysCount()
    {
        birdsPerDay[birdsPerDay.Length - 1]++;
    }

    public bool HasDayWithoutBirds()
    {
        bool noBirdDay = false;
        foreach (var count in birdsPerDay)
        {
            if (count == 0)
            {
                noBirdDay = true;
            }
        }
        return noBirdDay;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int count = 0;
        for (int i = 0; i < Math.Min(numberOfDays, birdsPerDay.Length); i++)
        {
            count += birdsPerDay[i];
        }
        return count;
    }

    public int BusyDays()
    {
        int count = 0;
        foreach (var perDay in birdsPerDay)
        {
            if (perDay >= 5)
            {
                count++;
            }
        }
        return count;
    }
}
