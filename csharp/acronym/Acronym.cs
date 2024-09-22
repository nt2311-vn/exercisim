using System;

public static class Acronym
{
    public static string Abbreviate(string phrase)
    {
        string acronym = "";
        var listOfWord = phrase.Replace("-", " ").Replace("_", " ").Split(" ");

        foreach (var word in listOfWord)
        {
            if (word.Length > 0 && char.IsLetter(word[0]))
            {
                acronym += word[0].ToString().ToUpper();
            }
        }

        return acronym;
    }
}
