const ascii = @import("std").ascii;

pub fn isValidIsbn10(s: []const u8) bool {
    if (s.len < 10) return false;

    var sum: usize = 0;
    var index: usize = 10;

    for (s) |c| switch (c) {
        '0'...'9' => {
            const num = c - '0';
            sum += index * @as(usize, @intCast(num));
            if (index == 0) return false;
            index -= 1;
        },
        '-' => {},
        'X' => {
            sum += 10;
        },
        else => return false,
    };

    return sum % 11 == 0;
}
