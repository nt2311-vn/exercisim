using System;
using System.Collections.Generic;

public static class Languages
{
    public static List<string> NewList() => new List<string>();

    public static List<string> GetExistingLanguages() =>
        new List<string>() { "C#", "Clojure", "Elm" };

    public static List<string> AddLanguage(List<string> languages, string language)
    {
        languages.Add(language);
        return languages;
    }

    public static int CountLanguages(List<string> languages) => languages.Count;

    public static bool HasLanguage(List<string> languages, string language) =>
        languages.Contains(language);

    public static List<string> ReverseList(List<string> languages)
    {
        languages.Reverse();
        return languages;
    }

    public static bool IsExciting(List<string> languages) =>
        languages.Count == 0
            ? false
            : languages[0] == "C#"
                ? true
                : (languages.Count == 2 || languages.Count == 3) && languages[1] == "C#"
                    ? true
                    : false;

    public static List<string> RemoveLanguage(List<string> languages, string language)
    {
        languages.Remove(language);
        return languages;
    }

    public static bool IsUnique(List<string> languages)
    {
        bool _unique = true;
        languages.Sort();

        for (int i = 0; i < languages.Count - 1; i++)
        {
            if (languages[i] == languages[i + 1])
            {
                _unique = false;
            }
        }
        return _unique;
    }
}
