using System;
using System.Linq;

public enum Schedule
{
    Teenth,
    First,
    Second,
    Third,
    Fourth,
    Last
}

public class Meetup
{
    private int _month;
    private int _year;

    public Meetup(int month, int year)
    {
        _month = month;
        _year = year;
    }

    public DateTime Day(DayOfWeek dayOfWeek, Schedule schedule)
    {
        int daysInMonth = DateTime.DaysInMonth(_year, _month);
        var dayRange = Enumerable.Range(1, daysInMonth);

        if (schedule == Schedule.Teenth)
        {
            int getDay = dayRange.First(
                day =>
                    new DateTime(_year, _month, day).DayOfWeek == dayOfWeek
                    && day >= 13
                    && day <= 19
            );

            return new DateTime(_year, _month, getDay);
        }

        var matchNth = dayRange.Where(
            day => new DateTime(_year, _month, day).DayOfWeek == dayOfWeek
        );

        if (schedule == Schedule.First)
        {
            int getDay = matchNth.First();
            return new DateTime(_year, _month, getDay);
        }

        if (schedule == Schedule.Last)
        {
            int getDay = matchNth.Last();

            return new DateTime(_year, _month, getDay);
        }

        if (schedule == Schedule.Second)
        {
            int getDay = matchNth.Skip(1).First();
            return new DateTime(_year, _month, getDay);
        }

        if (schedule == Schedule.Third)
        {
            int getDay = matchNth.Skip(2).First();
            return new DateTime(_year, _month, getDay);
        }

        if (schedule == Schedule.Fourth)
        {
            int getDay = matchNth.Skip(3).First();
            return new DateTime(_year, _month, getDay);
        }

        return DateTime.Now;
    }
}
