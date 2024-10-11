const std = @import("std");
pub fn primes(buffer: []u32, limit: u32) []u32 {
    if (limit < 2) return &[_]u32{};

    buffer[0] = 2;
    if (limit == 2) {
        return buffer[0..1];
    }

    var index: usize = 1;
    outer: for (3..limit + 1) |num| {
        var divide: usize = 2;
        var is_prime: bool = true;
        while (divide < num) : (divide += 1) {
            if (num % divide == 0) {
                is_prime = false;
                continue :outer;
            }
        }

        if (is_prime) {
            buffer[index] = @as(u32, @intCast(num));
            index += 1;
        }
    }

    return buffer[0..index];
}
