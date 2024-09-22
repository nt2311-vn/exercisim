using System;

public class Player
{
    public int RollDie()
    {
        var rand = new Random();
        return rand.Next(1, 18) + 1;
    }

    public double GenerateSpellStrength()
    {
        var rand = new Random();
        return rand.NextDouble() * 100;
    }
}
