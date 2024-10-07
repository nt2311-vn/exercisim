const ascii = @import("std").ascii;

pub fn isValidIsbn10(s: []const u8) bool {
    var total: u32 = 0;
    var digit_count: u32 = 0;
    var multiply: u32 = 10;

    for (s) |char| {
        if (char == '-') continue;
        if (digit_count == 9) {
            if (char == 'X') {
                total += 10;
            } else if (ascii.isDigit(char)) {
                total += @as(u32, @intCast(char - '0'));
            } else {
                return false;
            }
            digit_count += 1;
        } else if (digit_count < 9) {
            if (!ascii.isDigit(char)) return false;
            const num = @as(u32, @intCast(char - '0'));
            total += num * multiply;
            multiply -= 1;
            digit_count += 1;
        } else {
            return false;
        }
    }

    return digit_count == 10 and total % 11 == 0;
}
