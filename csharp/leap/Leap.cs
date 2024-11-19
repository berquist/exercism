using System;

public static class Leap
{
    public static bool IsLeapYear(int year) =>
        DateTime.IsLeapYear(year);
        // (year % 4 == 0) && ((year % 400 == 0) || !(year % 100 == 0));
}
