const std = @import("std");
const mem = std.mem;

const vowels = [5]u8{ 'a', 'i', 'u', 'e', 'o' };

pub fn translate(allocator: mem.Allocator, phrase: []const u8) mem.Allocator.Error![]u8 {
    _ = allocator;
    _ = phrase;
    @compileError("please implement the translate function");
}
