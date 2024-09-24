const std = @import("std");

// pub fn isPangram(str: []const u8) bool {
//     var set = std.bit_set.IntegerBitSet(26).initEmpty();
//     for (str) |c| {
//         if (!ascii.isAlphabetic(c)) {
//             continue;
//         }
//         set.set(ascii.toLower(c) - 'a');
//     }
//
//     return set.count() == 26;
// }

pub fn isPangram(str: []const u8) bool {
    var seen = [_]bool{false} ** 26;
    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            const lower = std.ascii.toLower(c);
            seen[lower - 'a'] = true;
        }
    }

    for (seen) |is_seen| {
        if (!is_seen) {
            return false;
        }
    }

    return true;
}
