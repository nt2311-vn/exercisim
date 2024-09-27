const std = @import("std");
const mem = std.mem;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var encoded = try allocator.alloc(u8, s.len + s.len / 5);
    errdefer allocator.free(encoded);
    var insert_pos: usize = 0;
    for (s) |c| {
        if (!std.ascii.isAlphanumeric(c)) continue;
        const lower = std.ascii.toLower(c);
        encoded[insert_pos] = if ('a' <= lower) 25 - (lower - 'a') + 'a' else lower;
        insert_pos += 1;

        if (insert_pos % 6 == 5) {
            encoded[insert_pos] = ' ';
            insert_pos += 1;
        }
    }

    if (encoded[insert_pos - 1] == ' ') insert_pos -= 1;
    _ = allocator.resize(encoded, insert_pos);
    encoded.len = insert_pos;

    return encoded;
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var decoded = try allocator.alloc(u8, s.len);
    errdefer allocator.free(decoded);
    var cur_pos: usize = 0;

    for (s) |c| {
        if (!std.ascii.isAlphanumeric(c)) continue;
        decoded[cur_pos] = if ('a' <= c) 25 - (c - 'a') + 'a' else c;
        cur_pos += 1;
    }

    _ = allocator.resize(decoded, cur_pos);
    decoded.len = cur_pos;

    return decoded;
}
