using System;
using System.Linq;

public static class RotationalCipher
{
    public static string Rotate(string text, int shiftKey)
    {
        if (shiftKey < 0 || shiftKey > 26)
        {
            throw new Exception();
        }
        string cipherChain = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";

        var rotatedText = new string(
            text.Select(c =>
                {
                    if (char.IsLetter(c))
                    {
                        char baseChar = char.IsUpper(c) ? 'A' : 'a';
                        return (char)((c - baseChar + shiftKey) % 26 + baseChar);
                    }
                    return c;
                })
                .ToArray()
        );

        return rotatedText;
    }
}
