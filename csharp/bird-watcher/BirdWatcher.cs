class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek() => new[] { 0, 2, 5, 3, 7, 8, 4 };

    public int Today() => this.birdsPerDay[this.birdsPerDay.Length - 1];

    public void IncrementTodaysCount() => this.birdsPerDay[this.birdsPerDay.Length - 1] += 1;

    public bool HasDayWithoutBirds()
    {
        for (int i = 0; i < this.birdsPerDay.Length; i++) {
            if (this.birdsPerDay[i] == 0) {
                return true;
            }
        }
        return false;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        var count = 0;
        for (int i = 0; i < numberOfDays; i++) {
            count += this.birdsPerDay[i];
        }
        return count;
    }

    public int BusyDays()
    {
        var count = 0;
        for (int i = 0; i < this.birdsPerDay.Length; i++) {
            if (this.birdsPerDay[i] >= 5) {
                count += 1;
            }
        }
        return count;
    }
}
