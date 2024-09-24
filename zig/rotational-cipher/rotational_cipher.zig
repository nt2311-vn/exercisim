const mem = @import("std").mem;
const alphabet_str = [26]u8{ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
const alphabet_str_cap = [26]u8{ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

fn indexArr(arr: *const [26]u8, element: u8) ?usize {
    return mem.indexOfScalar(u8, arr, element);
}

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    const memory = try allocator.alloc(u8, text.len);
    errdefer allocator.free(memory);
    for (text, 0..) |c, i| {
        const lower_index = indexArr(&alphabet_str, c);
        const upper_index = indexArr(&alphabet_str_cap, c);

        memory[i] = if (lower_index) |index| alphabet_str[(index + shiftKey) % 26] else if (upper_index) |index| alphabet_str_cap[(index + shiftKey) % 26] else c;
    }

    return memory;
}
