const ascii = @import("std").ascii;
const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var set = std.bit_set.IntegerBitSet(26).initEmpty();
    for (str) |c| {
        if (!ascii.isAlphabetic(c)) {
            continue;
        }
        set.set(ascii.toLower(c) - 'a');
    }

    return set.count() == 26;
}
