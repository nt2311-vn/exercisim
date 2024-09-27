const std = @import("std");
pub fn isValid(s: []const u8) bool {
    var s_len = s.len;
    if (s_len < 2) return false;

    var must_double = false;
    var sum: u32 = 0;
    var num_digits: u32 = 0;
    while (s_len > 0) {
        s_len -= 1;
        var c = s[s_len];
        if (c == ' ') continue;
        if (c < '0' or c > '9') return false;
        num_digits += 1;
        c -= '0';
        if (must_double) {
            c *= 2;
            c = if (c > 9) c - 9 else c;
        }
        must_double = !must_double;
        sum += c;
    }

    if (num_digits < 2) return false;
    return sum % 10 == 0;
}
