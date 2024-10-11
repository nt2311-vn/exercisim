const std = @import("std");
const mem = std.mem;
const fmt = std.fmt;

pub fn recite(allocator: mem.Allocator, words: []const []const u8) (fmt.AllocPrintError || mem.Allocator.Error)![][]u8 {
    var rs = std.ArrayList([]u8).init(allocator);
    defer rs.deinit();

    if (words.len == 0) return rs.toOwnedSlice();
    if (words.len == 1) {
        const line = try fmt.allocPrint(allocator, "And all for the want of a {s}.\n", .{words[0]});

        try rs.append(line);
        return rs.toOwnedSlice();
    }

    for (words, 0..) |word, i| {
        if (i == words.len - 1) {
            const line = try fmt.allocPrint(allocator, "And all for the want of a {s}.\n", .{words[0]});
            try rs.append(line);
        }

        if (i < words.len - 1) {
            const line = try fmt.allocPrint(allocator, "For want of a {s} the {s} was lost.\n", .{ word, words[i + 1] });
            try rs.append(line);
        }
    }

    return rs.toOwnedSlice();
}
