using Xunit;
using Exercism.Tests;
using System;

public class LogAnalysisTests
{
    [Fact]
    [Task(1)]
    public void SubstringAfter_WithDelimiterOfLength1()
    {
        Assert.Equal(" am the 1st test", "I am the 1st test".SubstringAfter("I"));
    }

    [Fact]
    [Task(1)]
    public void SubstringAfter_WithDelimiterOfLengthLongerThan1()
    {
        Assert.Equal(" test", "I am the 2nd test".SubstringAfter("2nd"));
    }

    [Fact]
    [Task(2)]
    public void SubstringBetween()
    {
        Assert.Equal("INFO", "[INFO]: File Deleted.".SubstringBetween("[", "]"));
    }

    [Fact]
    [Task(2)]
    public void SubstringBetweenLongerDelimiters()
    {
        Assert.Equal("SOMETHING", "FIND >>> SOMETHING <===< HERE".SubstringBetween(">>> ", " <===<"));
    }
    
    [Fact]
    [Task(3)]
    public void Message()
    {
        var log = "[WARNING]: Library is deprecated.";
        Assert.Equal("Library is deprecated.", log.Message());
    }

    [Fact]
    [Task(4)]
    public void LogLevel()
    {
        var log = "[WARNING]: Library is deprecated.";
        Assert.Equal("WARNING", log.LogLevel());
    }

    [Fact]
    [Task(5)]
    public void SubstringBefore1()
    {
        var log = "[WARNING]: Library is deprecated.";
        Assert.Equal("[WARNING", log.SubstringBefore("]"));
    }

    [Fact]
    [Task(6)]
    public void SubstringBefore2()
    {
        var log = "[WARNING]: Library is deprecated.";
        Assert.Equal("[WARNING", log.SubstringBefore("]: Library"));
    }

    [Fact]
    [Task(7)]
    public void SubstringBefore_Empty()
    {
        var log = "[WARNING]: Library is deprecated.";
        Assert.Equal("", log.SubstringBefore("["));
    }
}
