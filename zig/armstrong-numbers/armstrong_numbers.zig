const std = @import("std");
const math = @import("std").math;
pub fn isArmstrongNumber(num: u128) bool {
    var buffer: [64]u8 = undefined;
    const str = std.fmt.bufPrint(&buffer, "{d}", .{num}) catch unreachable;
    var sum: u128 = 0;

    for (str) |c| {
        const digit = c - '0';
        sum += math.powi(u128, digit, str.len) catch unreachable;
    }

    return sum == num;
}
