const std = @import("std");
const mem = std.mem;
const toUpper = std.ascii.toUpper;
const isAlpha = std.ascii.isAlphabetic;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var acronym = try allocator.alloc(u8, words.len);
    defer allocator.free(acronym);

    var count: usize = 0;

    for (words, 0..) |c, i| {
        if (i == 0) {
            acronym[count] = toUpper(c);
            count += 1;
            continue;
        }

        if ((c == ' ' or c == '-' or c == '_') and i < words.len - 1) {
            if (isAlpha(words[i + 1])) {
                acronym[count] = toUpper(words[i + 1]);
                count += 1;
            }
        }
    }

    return try allocator.dupe(u8, acronym[0..count]);
}
