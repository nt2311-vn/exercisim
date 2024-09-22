const ascii = @import("std").ascii;

pub fn score(s: []const u8) u32 {
    var result: u32 = 0;

    for (s) |c| {
        result += switch (ascii.toLower(c)) {
            'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' => 1,
            'd', 'g' => 2,
            'b', 'c', 'm', 'p' => 3,
            'f', 'h', 'v', 'w', 'y' => 4,
            'k' => 5,
            'j', 'x' => 8,
            'q', 'z' => 10,
            else => 0,
        };
    }

    return result;
}
