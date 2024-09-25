const std = @import("std");
pub fn twoFer(buffer: []u8, name: ?[]const u8) anyerror![]u8 {
    const real_name = if (name) |your_name| your_name else "you";
    return try std.fmt.bufPrint(buffer, "One for {s}, one for me.", .{real_name});
}
