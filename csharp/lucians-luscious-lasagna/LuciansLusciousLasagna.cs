class Lasagna
{
    public int ExpectedMinutesInOven() {
        return 40;
    }

    public int RemainingMinutesInOven(int actualMinutes) {
        return ExpectedMinutesInOven() - actualMinutes;
    }

    public int PreparationTimeInMinutes(int numberOfLayers) {
        return numberOfLayers * 2;
    }

    public int ElapsedTimeInMinutes(int numberOfLayers, int minutesInOven) {
        return PreparationTimeInMinutes(numberOfLayers) + minutesInOven;
    }
}
