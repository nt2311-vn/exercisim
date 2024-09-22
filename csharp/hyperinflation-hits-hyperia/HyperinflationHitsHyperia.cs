using System;

public static class CentralBank
{
    public static string DisplayDenomination(long @base, long multiplier)
    {
        try
        {
            var result = checked(@base * multiplier);
            return result.ToString();
        }
        catch (OverflowException)
        {
            return "*** Too Big ***";
        }
    }

    public static string DisplayGDP(float @base, float multiplier)
    {
        try
        {
            var result = checked(@base * multiplier);
            if (result == float.PositiveInfinity)
            {
                return "*** Too Big ***";
            }
            return result.ToString();
        }
        catch (System.Exception)
        {
            return "*** Too Big ***";
        }
    }

    public static string DisplayChiefEconomistSalary(decimal salaryBase, decimal multiplier)
    {
        try
        {
            var result = checked(salaryBase * multiplier);
            return result.ToString();
        }
        catch (System.Exception)
        {
            return "*** Much Too Big ***";
        }
    }
}
