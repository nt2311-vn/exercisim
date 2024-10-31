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

pub fn translate(allocator: mem.Allocator, phrase: []const u8) mem.Allocator.Error![]u8 {
    _ = allocator;
    _ = phrase;
    @compileError("please implement the translate function");
}
