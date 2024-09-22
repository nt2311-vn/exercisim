using System;

class WeighingMachine
{
    // TODO: define the 'Precision' property

    public WeighingMachine(int precision)
    {
        Precision = precision;
    }

    public int Precision { get; }

    // TODO: define the 'Weight' property
    private double _weight;
    public double Weight
    {
        get => _weight;
        set
        {
            if (value < 0)
            {
                throw new ArgumentOutOfRangeException();
            }
            _weight = value;
        }
    }

    // TODO: define the 'DisplayWeight' property
    public string DisplayWeight
    {
        get { return $"{(_weight - _tareAdjust).ToString($"F{Precision}")} kg"; }
    }

    // TODO: define the 'TareAdjustment' property
    private double _tareAdjust = 5;
    public double TareAdjustment
    {
        get => _tareAdjust;
        set => _tareAdjust = value;
    }
}
