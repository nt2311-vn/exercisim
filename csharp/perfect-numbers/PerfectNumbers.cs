using System;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int number)
    {
        if (number <= 0)
        {
            throw new ArgumentOutOfRangeException();
        }
        int bound = (int)(number / 2);
        int result = Enumerable.Range(1, bound).Where(x => number % x == 0).Sum();

        if (result == number)
        {
            return Classification.Perfect;
        }
        else if (result > number)
        {
            return Classification.Abundant;
        }
        else
        {
            return Classification.Deficient;
        }
    }
}
