const std = @import("std");
const ascii = std.ascii;
const mem = std.mem;

fn isQuestion(sen: []const u8) bool {
    return if (sen[sen.len - 1] == '?') true else false;
}

fn isAllCap(sen: []const u8) bool {
    var is_upper = false;
    for (sen) |c| {
        if (ascii.isLower(c)) {
            return false;
        }

        if (ascii.isUpper(c)) {
            is_upper = true;
        }
    }

    return is_upper;
}

pub fn response(s: []const u8) []const u8 {
    const s_trim = mem.trim(u8, s, &ascii.whitespace);

    if (s_trim.len == 0) {
        return "Fine. Be that way!";
    }

    const is_shout = isAllCap(s_trim);
    const is_question = isQuestion(s_trim);
    if (is_shout and is_question) {
        return "Calm down, I know what I'm doing!";
    }

    if (is_shout) {
        return "Whoa, chill out!";
    }
    if (is_question) {
        return "Sure.";
    }

    return "Whatever.";
}
