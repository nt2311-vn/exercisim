const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var stack = std.ArrayList(u8).init(allocator);
    defer stack.deinit();

    for (s) |char| {
        switch (char) {
            '[' => try stack.append(']'),
            '{' => try stack.append('}'),
            '(' => try stack.append(')'),
            ']', '}', ')' => if (stack.popOrNull() != char) return false,
            else => {},
        }
    }

    return stack.items.len == 0;
}
