pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    for (s, 0..) |c, i| {
        buffer[s.len - i - 1] = c;
    }

    return buffer;
}
