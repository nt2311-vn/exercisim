using System;

public class SpaceAge
{
    private int _ageSeconds;

    public SpaceAge(int seconds)
    {
        this._ageSeconds = seconds;
    }

    public double OnEarth() => (double)this._ageSeconds / 31557600;

    public double OnMercury() => (double)(OnEarth() / 0.2408467);

    public double OnVenus() => (double)OnEarth() / 0.61519726;

    public double OnMars() => (double)OnEarth() / 1.8808158;

    public double OnJupiter() => (double)OnEarth() / 11.862615;

    public double OnSaturn() => (double)OnEarth() / 29.447498;

    public double OnUranus() => (double)OnEarth() / 84.016846;

    public double OnNeptune() => (double)OnEarth() / 164.79132;
}
