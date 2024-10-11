const std = @import("std");
const mem = std.mem;
const fmt = std.fmt;

pub fn recite(allocator: mem.Allocator, words: []const []const u8) (fmt.AllocPrintError || mem.Allocator.Error)![][]u8 {
    const rs: [][]u8 = try allocator.alloc([]u8, words.len);
    defer allocator.free(rs);

    if (words.len == 0) return rs;

    if (words.len == 1) {
        fmt.bufPrint(rs[0], "And all for the want of a {s}.\n", .{words[0]});
    }

    for (words, 0..) |word, i| {
        if (i == words.len - 1) {
            fmt.bufPrint(rs[i], "And all for the want of a {s}.\n", .{words[0]});
            break;
        }

        fmt.bufPrint(rs[i], "For want of a {s} the {s} was lost.\n", .{ word, words[i + 1] });
    }

    return rs;
}
