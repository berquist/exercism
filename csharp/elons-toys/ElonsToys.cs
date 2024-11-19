class RemoteControlCar
{
    private int _battery = 100;
    private int _metersDriven;

    public static RemoteControlCar Buy() => new RemoteControlCar();

    public string DistanceDisplay() => $"Driven {_metersDriven} meters";

    public string BatteryDisplay() => _battery > 0 ? $"Battery at {_battery}%" : "Battery empty";

    public void Drive()
    {
        if (_battery > 0) {
            _battery -= 1;
            _metersDriven += 20;
        }
    }
}
