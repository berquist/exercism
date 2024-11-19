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
    
    public static double ProductionRatePerHour(int speed)
    {
        return speed * 221 * SuccessRate(speed);
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)Math.Floor(ProductionRatePerHour(speed) / 60.0);
    }
}
