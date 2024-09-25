const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    // var map = std.AutoHashMap(u32, void).init(allocator);
    // defer map.deinit();
    //
    // for (factors) |n| {
    //     if (n == 0) continue;
    //     var i = n;
    //     while (i < limit) : (i += n)
    //         try map.put(i, {});
    // }
    //
    // var total: u64 = 0;
    // var keys = map.keyIterator();
    //
    // while (keys.next()) |i|
    //     total += i.*;
    //
    // return total;

    var static_arr = try allocator.alloc(bool, limit);
    defer allocator.free(static_arr);

    for (static_arr) |*is_multiple| {
        is_multiple.* = false;
    }

    var total: u64 = 0;

    for (factors) |n| {
        if (n == 0) continue;
        var i = n;
        while (i < limit) : (i += n) {
            static_arr[i] = true;
        }
    }

    for (static_arr, 0..) |is_multiple, idx| {
        if (is_multiple) {
            total += idx;
        }
    }

    return total;
}
