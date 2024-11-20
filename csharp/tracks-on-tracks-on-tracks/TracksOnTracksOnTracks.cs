using System;
using System.Collections.Generic;

public static class Languages
{
    public static List<string> NewList() => new();

    public static List<string> GetExistingLanguages() => new(new string[]{"C#", "Clojure", "Elm"});

    public static List<string> AddLanguage(List<string> languages, string language)
    {
        languages.Add(language);
        return languages;
    }

    public static int CountLanguages(List<string> languages) => languages.Count;

    public static bool HasLanguage(List<string> languages, string language) => languages.Contains(language);

    public static List<string> ReverseList(List<string> languages)
    {
        var reversed = new List<string>(languages.ToArray());
        reversed.Reverse();
        return reversed;
    }

    public static bool IsExciting(List<string> languages) =>
        languages.Count switch {
        0 => false,
        1 => languages[0] == "C#",
        <= 3 => (languages[0] == "C#") || (languages[1] == "C#"),
        _ => false
    };
        // Initial solution since the question is unclear
        // ((languages.Count == 2) || (languages.Count == 3)) && (languages[0] == "C#") && (languages[1] == "C#");

    public static List<string> RemoveLanguage(List<string> languages, string language)
    {
        var removed = new List<string>(languages.ToArray());
        removed.Remove(language);
        return removed;
    }

    public static bool IsUnique(List<string> languages)
    {
        var unique = new HashSet<string>();
        foreach (var language in languages) {
            unique.Add(language);
        }
        return languages.Count == unique.Count;
    }
}
