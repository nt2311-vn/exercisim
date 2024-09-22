using System;
using System.Globalization;

public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late
}

public static class Appointment
{
    private static bool isWindows = OperatingSystem.IsWindows();

    public static DateTime ShowLocalTime(DateTime dateTimeUtc) => dateTimeUtc.ToLocalTime();

    public static DateTime Schedule(string appointmentDateDescription, Location location) { }

    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel) { }

    public static bool HasDaylightSavingChanged(DateTime dateTime, Location location) { }

    public static DateTime NormalizeDateTime(string dataTimeText, Location location) { }

    private static DateTimeFormatInfo GetDateTimeFormatInfo(Location location) =>
        GetLocationCultureInfo(location).DateTimeFormat;

    private static TimeZoneInfo GetTimeZoneInfo(Location location)
    {
        var timeZoneID = GetTimeZoneID(location);
        return TimeZoneInfo.FindSystemTimeZoneById(timeZoneID);
    }

    private static CultureInfo GetLocationCultureInfo(Location location)
    {
        var culture = location switch
        {
            Location.NewYork => "en-US",
            Location.London => "en-GB",
            Location.Paris => "fr-FR",
            _ => throw new ArgumentOutOfRangeException(),
        };
        return CultureInfo.GetCultureInfo(culture);
    }

    private static string GetTimeZoneID(Location location) =>
        location switch
        {
            Location.NewYork => isWindows ? "Eastern Standard Time" : "America/New_York",
            Location.London => isWindows ? "GMT Standard Time" : "Europe/London",
            Location.Paris => isWindows ? "W. Europe Standard Time" : "Europe/Paris",
            _ => throw new ArgumentOutOfRangeException(),
        };
}
