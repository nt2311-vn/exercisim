using System;

public static class SimpleCalculator
{
    public static string Calculate(int operand1, int operand2, string operation)
    {
        try
        {
            if (operand1 == null || operand2 == null || operation == null)
            {
                throw new ArgumentNullException();
            }
            if (operation.Length == 0)
            {
                throw new ArgumentException();
            }

            switch (operation)
            {
                case "+":
                    return $"{operand1} {operation} {operand2} = {operand1 + operand2}";
                case "*":
                    return $"{operand1} {operation} {operand2} = {operand1 * operand2}";
                case "/":
                    if (operand2 == 0)
                    {
                        throw new DivideByZeroException();
                    }
                    return $"{operand1} {operation} {operand2} = {operand1 / operand2}";
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
        catch (DivideByZeroException)
        {
            return "Division by zero is not allowed.";
        }
    }
}
