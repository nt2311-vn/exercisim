const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var map_match = std.AutoHashMap(u8, u8).init(allocator);
    defer map_match.deinit();

    // Map of opening to closing brackets
    try map_match.put('{', '}');
    try map_match.put('[', ']');
    try map_match.put('(', ')');

    var stack = std.ArrayList(u8).init(allocator);
    defer stack.deinit();

    for (s) |char| {
        if (map_match.get(char) != null) {
            try stack.append(char);
        } else if (stack.items.len > 0) {
            const last_open = stack.getLast();
            const expected_close = map_match.get(last_open);

            if (expected_close != null and expected_close.? == char) {
                _ = stack.pop();
            } else if (char == '}' or char == ']' or char == ')') {
                return false;
            }
        } else if (char == '}' or char == ']' or char == ')') {
            return false;
        }
    }

    return stack.items.len == 0;
}
