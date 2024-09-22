using System;
using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var sortedString = word.ToLower().ToCharArray();
        Array.Sort(sortedString);

        bool isoGram = true;
        for (int i = 0; i < sortedString.Length - 1; i++)
        {
            if (char.IsLetter(sortedString[i]) && sortedString[i] == sortedString[i + 1])
            {
                isoGram = false;
                break;
            }
        }
        return isoGram;
    }
}
