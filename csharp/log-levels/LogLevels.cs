using System.Text.RegularExpressions;

static class LogLine
{
    private static readonly string regex = @"\[(?<Level>INFO|WARNING|ERROR)\]: (?<Message>.*)";
    private static Match getLogLevelMatches(string logLine) =>
        Regex.Match(logLine, regex);

    public static string Message(string logLine) =>
        getLogLevelMatches(logLine).Groups["Message"].ToString().Trim();

    public static string LogLevel(string logLine) =>
        getLogLevelMatches(logLine).Groups["Level"].ToString().ToLower();

    public static string Reformat(string logLine) =>
        $"{Message(logLine)} ({LogLevel(logLine)})";
}
