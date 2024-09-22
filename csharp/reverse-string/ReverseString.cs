using System;
using System.Linq;

public static class ReverseString
{
    public static string Reverse(string input) => new string(input.Reverse().ToArray());
    /*
    string reverseString = "";
    for (int i = input.Length - 1; i >= 0; i--)
    {
        reverseString += input[i];
    }
    return reverseString;
    */
}
