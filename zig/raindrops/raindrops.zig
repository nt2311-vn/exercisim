const std = @import("std");
pub fn convert(buffer: []u8, n: u32) []const u8 {
    // var stream = std.io.fixedBufferStream(buffer);
    // if (n % 3 == 0) stream.writer().writeAll("Pling") catch unreachable;
    // if (n % 5 == 0) stream.writer().writeAll("Plang") catch unreachable;
    // if (n % 7 == 0) stream.writer().writeAll("Plong") catch unreachable;
    //
    // if (stream.pos == 0) stream.writer().print("{d}", .{n}) catch unreachable;
    // return stream.getWritten();

    const out = std.fmt.bufPrint(buffer, "{s}{s}{s}", .{
        if (n % 3 == 0) "Pling" else "",
        if (n % 5 == 0) "Plang" else "",
        if (n % 7 == 0) "Plong" else "",
    }) catch unreachable;

    return if (out.len > 0) out else std.fmt.bufPrint(buffer, "{d}", .{n}) catch unreachable;
}
