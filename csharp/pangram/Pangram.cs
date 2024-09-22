using System;
using System.Collections.Generic;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        Dictionary<char, bool> pangramWord = new Dictionary<char, bool>();
        input
            .ToCharArray()
            .Where(c => char.IsLetter(c))
            .ToList()
            .ForEach(c => pangramWord[char.ToLower(c)] = true);

        return pangramWord.Count == 26;
    }
}
