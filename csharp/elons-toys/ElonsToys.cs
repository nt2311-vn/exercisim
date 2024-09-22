using System;

class RemoteControlCar
{
    private int _battery = 100;
    private int _distance;
    private int _batteryDrain = 1;

    public RemoteControlCar() { }

    public static RemoteControlCar Buy() => new RemoteControlCar();

    public string DistanceDisplay() => $"Driven {_distance} meters";

    public string BatteryDisplay() => _battery > 0 ? $"Battery at {_battery}%" : "Battery empty";

    public void Drive()
    {
        if (_battery >= _batteryDrain)
        {
            _battery--;
            _distance += 20;
        }
    }
}
