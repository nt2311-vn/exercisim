using System;

class RemoteControlCar
{
    private int _speed;
    private int _battery;
    private int _batteryDrain;
    private int _distance;

    public RemoteControlCar(int speed, int batteryDrain)
    {
        this._speed = speed;
        this._batteryDrain = batteryDrain;
    }

    public bool BatteryDrained() => _battery < _batteryDrain;

    public int DistanceDriven()
    {
        return BatteryDrained() ? _distance : _distance + _speed;
    }

    public void Drive()
    {
        if (!BatteryDrained())
        {
            _battery -= _batteryDrain;
            _distance += _speed;
        }
    }

    public static RemoteControlCar Nitro()
    {
        var car = new RemoteControlCar();
        this._speed = 50;
        this._batteryDrain = 4;
        return car;
    }
}

class RaceTrack
{
    private int _distance;

    public RaceTrack(int dst)
    {
        this._distance = dst;
    }

    public bool TryFinishTrack(RemoteControlCar car)
    {
        while (!BatteryDrained())
        {
            this._distance += this._speed;
            this._battery -= this._batteryDrain;
        }

        return this._distance >= RaceTrack();
    }
}
