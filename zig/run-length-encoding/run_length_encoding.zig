const std = @import("std");
const fmt = std.fmt;

pub fn encode(buffer: []u8, string: []const u8) []u8 {
    for (string, 1..) |_, i| {
        var count: u8 = 1;

        while (string[i] == string[i - 1]) {
            count += 1;
        }

        buffer += try fmt.bufPrint(buffer, "{d}{c}", .{ count, string[i] });
    }
}

pub fn decode(buffer: []u8, string: []const u8) []u8 {
    _ = buffer;
    _ = string;
    @compileError("please implement the decode function");
}
