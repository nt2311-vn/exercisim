const std = @import("std");
const mem = std.mem;
const toLower = std.ascii.toLower;
const isEqlLower = std.ascii.eqlIgnoreCase;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    var results = std.BufSet.init(allocator);
    errdefer results.deinit();

    outer: for (candidates) |candidate| {
        if (candidate.len != word.len) {
            continue :outer;
        }

        if (isEqlLower(word, candidate)) {
            continue :outer;
        }

        // var count_freq = [_]i8{0} ** 26;
        // for (word) |c| {
        //     const index = toLower(c) - 'a';
        //     count_freq[index] += 1;
        // }
        //
        // for (candidate) |c| {
        //     const index = toLower(c) - 'a';
        //     count_freq[index] -= 1;
        //     if (count_freq[index] < 0) {
        //         continue :outer;
        //     }
        // }

        // Using backward iterator in second time will beteter results
        var count_freq = [1]i8{0} ** 26;
        for (word) |c| {
            const index = toLower(c) - 'a';
            count_freq[index] += 1;
        }

        var i: usize = candidate.len - 1;
        while (true) {
            const index = toLower(candidate[i]) - 'a';
            count_freq[index] -= 1;
            if (count_freq[index] < 0) {
                continue :outer;
            }

            if (i == 0) break;
            i -= 1;
        }

        try results.insert(candidate);
    }

    return results;
}
