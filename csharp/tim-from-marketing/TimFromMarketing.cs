static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        var idStr = $"[{id}] - ";
        if (id == null) {
            idStr = "";
        }
        var dept = department?.ToUpper() ?? "OWNER";
        return $"{idStr}{name} - {dept}";
    }
}
