const std = @import("std");
const mem = @import("std").mem;
const debug = @import("std").debug;
const ascii = @import("std").ascii;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();
}
