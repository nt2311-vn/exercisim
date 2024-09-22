using System;

public static class PlayAnalyzer
{
    public static string AnalyzeOnField(int shirtNum)
    {
        switch (shirtNum)
        {
            case 1:
                return "goalie";
            case 2:
                return "left back";
            case 3:
            case 4:
                return "center back";
            case 5:
                return "right back";
            case 6:
            case 7:
            case 8:
                return "midfielder";
            case 9:
                return "left wing";
            case 10:
                return "striker";
            case 11:
                return "right wing";
            default:
                throw new ArgumentOutOfRangeException();
        }
    }

    public static string AnalyzeOffField(object report) =>
        report switch
        {
            int supporters => $"There are {supporters} supporters at the match.",
            String announcement => announcement,
            Injury injury => $"Oh no! {injury.GetDescription()} Medics are on the field.",
            Incident incident => incident.GetDescription(),
            Manager manager => ManagerDescription(manager),
            _ => throw new ArgumentException(nameof(report), $"Not expected data type: {report}")
        };

    private static string ManagerDescription(Manager manager) =>
        (manager.Club is null) ? manager.Name : $"{manager.Name} ({manager.Club})";
}
