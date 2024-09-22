using System;
using System.Collections.Generic;
using System.Linq;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max) =>
        Enumerable
            .Range(1, max - 1)
            .Where(x => multiples.Any(multiple => multiple != 0 && x % multiple == 0))
            .Sum();
    /*
    if (multiples.All(x => x == 0 || x == null))
    {
        return 0;
    }
    var values = multiples.Where(x => x < max && x > 0).ToArray();

    if (values.Length == 0)
    {
        return 0;
    }

    List<int> list = new List<int>();

    foreach (var item in values)
    {
        int i = 1;
        while (i * item < max)
        {
            list.Add(item * i);
            i++;
        }
    }

    return list.Distinct().Sum();
    */
}
