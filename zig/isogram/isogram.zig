const std = @import("std");
pub fn isIsogram(str: []const u8) bool {
    var set = std.bit_set.IntegerBitSet(26).initEmpty();
    var count_not_alpha: u16 = 0;

    for (str) |c| {
        if (!std.ascii.isAlphabetic(c)) {
            count_not_alpha += if (c == ' ' or c == '-') 1 else 0;
        } else {
            const lower = std.ascii.toLower(c);
            set.set(lower - 'a');
        }
    }

    return set.count() == str.len - count_not_alpha;
}

// pub fn isIsogram(str: []const u8) bool {
//     var seen = [_]bool{false} ** 26;
//
//     for (str) |c| {
//         if (std.ascii.isAlphabetic(c)) {
//             const lower = std.ascii.toLower(c);
//             seen[lower - 'a'] = true;
//         }
//     }
//
//     for (seen) |is_seen| {
//         if (!is_seen) {
//             return false;
//         }
//     }
//
//     return true;
// }
