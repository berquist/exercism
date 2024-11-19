// ideas from https://exercism.org/tracks/csharp/exercises/cars-assemble/solutions/kirill9

using System;

static class AssemblyLine
{
    public static double SuccessRate(int speed) => speed switch
    {
        < 1 => 0.0,
        <= 4 => 1.0,
        <= 8 => 0.9,
        9 => 0.8,
        10 => 0.77,
        _ => 0.0
    };

    private static readonly int _baseProductionRatePerHour = 221;
    
    public static double ProductionRatePerHour(int speed) => speed * _baseProductionRatePerHour * SuccessRate(speed);

    public static int WorkingItemsPerMinute(int speed) => (int)Math.Floor(ProductionRatePerHour(speed) / 60.0);
}
