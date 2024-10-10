const std = @import("std");
const mem = std.mem;

pub const Signal = enum {
    wink,
    double_blink,
    close_your_eyes,
    jump,
};

pub fn calculateHandshake(allocator: mem.Allocator, number: u5) mem.Allocator.Error![]const Signal {
    var secrets = try std.ArrayList(Signal).initCapacity(allocator, 4);
    defer secrets.deinit();

    if (number & 0b00001 != 0) try secrets.append(Signal.wink);
    if (number & 0b00010 != 0) try secrets.append(Signal.double_blink);
    if (number & 0b00100 != 0) try secrets.append(Signal.close_your_eyes);
    if (number & 0b01000 != 0) try secrets.append(Signal.jump);
    if (number & 0b10000 != 0) mem.reverse(Signal, secrets.items);

    return secrets.toOwnedSlice();
}
