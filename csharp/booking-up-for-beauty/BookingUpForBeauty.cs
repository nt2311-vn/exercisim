using System;

static class Appointment
{
    public static DateTime Schedule(string appointmentDateDescription) =>
        DateTime.Parse(appointmentDateDescription);

    public static bool HasPassed(DateTime appointmentDate) =>
        appointmentDate.CompareTo(DateTime.Now) < 0;

    public static bool IsAfternoonAppointment(DateTime appointmentDate) =>
        appointmentDate.Hour >= 12 && appointmentDate.Hour < 18;

    public static string Description(DateTime appointmentDate) =>
        $"You have an appointment on {appointmentDate.ToString("M/d/yyyy h:mm:ss tt.")}";

    public static DateTime AnniversaryDate() => DateTime.Parse("2024-09-15");
}
