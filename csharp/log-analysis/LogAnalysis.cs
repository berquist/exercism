public static class LogAnalysis 
{
    public static string SubstringAfter(this string str, string delimiter) =>
        str.Substring(str.IndexOf(delimiter) + delimiter.Length);

    public static string SubstringBefore(this string str, string delimiter) =>
        str.Substring(0, str.IndexOf(delimiter));

    public static string SubstringBetween(this string str, string left, string right) =>
        str.SubstringAfter(left).SubstringBefore(right);
    
    public static string Message(this string str) => str.SubstringAfter("]: ");

    public static string LogLevel(this string str) => str.SubstringBetween("[", "]");
}
