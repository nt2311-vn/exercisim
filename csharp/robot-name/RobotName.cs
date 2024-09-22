using System;
using System.Collections.Generic;

public class Robot
{
    private static HashSet<string> usedNames = new HashSet<string>();
    private string name;

    public Robot()
    {
        Reset();
    }

    public string Name
    {
        get { return name; }
    }

    public void Reset()
    {
        do
        {
            GenerateRandomName();
        } while (!usedNames.Add(name));
    }

    private void GenerateRandomName()
    {
        var random = new Random();

        // Generate two random uppercase letters
        char firstLetter = (char)random.Next('A', 'Z' + 1);
        char secondLetter = (char)random.Next('A', 'Z' + 1);

        // Generate three random digits
        int randomDigits = random.Next(100, 1000);

        // Combine the generated characters and digits
        name = $"{firstLetter}{secondLetter}{randomDigits}";
    }
}
