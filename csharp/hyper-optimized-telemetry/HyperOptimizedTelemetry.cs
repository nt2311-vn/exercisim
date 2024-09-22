using System;
using System.Linq;

public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        var bytes = reading switch
        {
            < Int32.MinValue => BitConverter.GetBytes((long)reading).Prepend((byte)(256 - 8)),
            < Int16.MinValue => BitConverter.GetBytes((int)reading).Prepend((byte)(256 - 4)),
            < UInt16.MinValue => BitConverter.GetBytes((short)reading).Prepend((byte)(256 - 2)),
            <= UInt16.MaxValue => BitConverter.GetBytes((ushort)reading).Prepend((byte)2),
            <= Int32.MaxValue => BitConverter.GetBytes((int)reading).Prepend((byte)(256 - 4)),
            <= UInt32.MaxValue => BitConverter.GetBytes((uint)reading).Prepend((byte)4),
            _ => BitConverter.GetBytes((long)reading).Prepend((byte)(256 - 8)),
        };

        return bytes.Concat(new byte[9 - bytes.Count()]).ToArray();
    }

    public static long FromBuffer(byte[] buffer) =>
        buffer[0] switch
        {
            256 - 8 or 4 or 2 => BitConverter.ToInt64(buffer, 1),
            256 - 4 => BitConverter.ToInt32(buffer, 1),
            256 - 2 => BitConverter.ToInt16(buffer, 1),
            _ => 0,
        };
}
