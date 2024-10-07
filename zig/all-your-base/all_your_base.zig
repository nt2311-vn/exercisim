const std = @import("std");
const mem = std.mem;
const math = std.math;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

/// Converts `digits` from `input_base` to `output_base`, returning a slice of digits.
/// Caller owns the returned memory.
pub fn convert(
    allocator: mem.Allocator,
    digits: []const u32,
    input_base: u32,
    output_base: u32,
) (mem.Allocator.Error || ConversionError)![]u32 {
    if (input_base <= 1) return ConversionError.InvalidInputBase;
    if (output_base <= 1) return ConversionError.InvalidOutputBase;

    if (digits.len == 0) {
        var ret = try allocator.alloc(u32, 1);
        ret[0] = 0;
        return ret;
    }

    return try baseFromInt(allocator, output_base, try intFromBase(digits, input_base));
}

fn intFromBase(input: []const u32, base: u32) ConversionError!u32 {
    var res: u32 = 0;
    const max: u32 = @as(u32, @intCast(input.len)) - 1;

    for (input, 0..) |num, i| {
        if (num >= base) return ConversionError.InvalidDigit;
        res += num * (math.powi(u32, base, max - @as(u32, @intCast(i))) catch unreachable);
    }

    return res;
}

fn baseFromInt(allocator: mem.Allocator, base: u32, input: u32) (mem.Allocator.Error || ConversionError)![]u32 {
    var res = std.ArrayList(u32).init(allocator);
    defer res.deinit();

    var rem: u32 = input;
    while (rem >= base) : (rem /= base) {
        try res.append(rem % base);
    }

    if (rem != 0) try res.append(rem);
    if (input == 0) try res.append(0);
    mem.reverse(u32, res.items);

    return res.toOwnedSlice();
}
