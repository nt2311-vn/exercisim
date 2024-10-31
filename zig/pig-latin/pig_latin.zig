const std = @import("std");
const mem = std.mem;
const ascii = std.ascii;

fn isVowels(c: u8) bool {
    return switch (ascii.toLower(c)) {
        'a', 'i', 'u', 'e', 'o' => true,
        else => false,
    };
}

fn translateTwoLetterYWord(allocator: mem.Allocator, word: []const u8) mem.Allocator.Error![]u8 {
    var result = try allocator.alloc(u8, word.len + 2);
    result[0] = word[1];
    result[1] = word[0];

    @memcpy(result[2..], "ay");
    return result;
}

fn translateWord(allocator: mem.Allocator, word: []const u8) mem.Allocator.Error![]u8 {
    if (word.len == 0) return allocator.dupe(u8, word);

    if (word.len == 2 and word[1] == 'y') {
        return translateTwoLetterYWord(allocator, word);
    }

    if (isVowels(word[0]) or mem.eql(u8, word[0..2], "xr") or mem.eql(u8, word[0..2], "yt")) {
        var result = try allocator.alloc(u8, word.len + 2);
        @memcpy(result[0..word.len], word);
        @memcpy(result[word.len..], "ay");

        return result;
    }

    var consonantEnd: usize = 0;

    while (consonantEnd < word.len and !isVowels(word[consonantEnd])) {
        if (consonantEnd + 1 < word.len) {
            if (word[consonantEnd] == 'q' and word[consonantEnd + 1] == 'u') {
                consonantEnd += 2;
                break;
            }

            if (word[consonantEnd] == 'y' and consonantEnd > 0) break;
        }
        consonantEnd += 1;
    }

    var result = try allocator.alloc(u8, word.len + 2);
    @memcpy(result[0 .. word.len - consonantEnd], word[consonantEnd..]);
    @memcpy(result[word.len - consonantEnd .. word.len], word[0..consonantEnd]);
    @memcpy(result[word.len..], "ay");

    return result;
}

pub fn translate(allocator: mem.Allocator, phrase: []const u8) mem.Allocator.Error![]u8 {
    var words = std.ArrayList([]u8).init(allocator);

    defer {
        for (words.items) |word| {
            allocator.free(word);
        }

        words.deinit();
    }

    var it = mem.split(u8, phrase, " ");

    while (it.next()) |word| {
        const translated = try translateWord(allocator, word);

        try words.append(translated);
    }

    const total_len = blk: {
        var len: usize = 0;
        for (words.items, 0..) |word, i| {
            len += word.len;

            if (i < words.items.len - 1) len += 1;
        }

        break :blk len;
    };

    var result = try allocator.alloc(u8, total_len);
    var idx: usize = 0;

    for (words.items, 0..) |word, i| {
        @memcpy(result[idx..][0..word.len], word);
        idx += word.len;

        if (i < words.items.len - 1) {
            result[idx] = ' ';
            idx += 1;
        }
    }

    return result;
}
