using System;

static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        string idFormat;
        string deptFormat;

        idFormat = id == null ? "" : $"[{id.ToString()}] - ";
        deptFormat = department == null ? " - OWNER" : $" - {department.ToUpper()}";

        return $"{idFormat}{name}{deptFormat}";
    }
}
