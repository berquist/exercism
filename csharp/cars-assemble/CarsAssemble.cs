using System;

static class AssemblyLine
{
    public static double SuccessRate(int speed)
    {
        var successRate = 0.0;
        if (speed == 10) {
            successRate = 0.77;
        } else if (speed == 9) {
            successRate = 0.80;
        } else if (speed >= 5) {
            successRate = 0.90;
        } else if (speed >= 1) {
            successRate = 1.00;
        }
        return successRate;
    }

    private static readonly int _baseProductionRatePerHour = 221;
    
    public static double ProductionRatePerHour(int speed) => speed * _baseProductionRatePerHour * SuccessRate(speed);

    public static int WorkingItemsPerMinute(int speed) => (int)Math.Floor(ProductionRatePerHour(speed) / 60.0);
}
