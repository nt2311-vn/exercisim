const std = @import("std");
pub const Category = enum {
    ones,
    twos,
    threes,
    fours,
    fives,
    sixes,
    full_house,
    four_of_a_kind,
    little_straight,
    big_straight,
    choice,
    yacht,
};

fn sum(dices: [5]u3) u32 {
    var total: u32 = 0;
    for (dices) |val| total += val;

    return total;
}

pub fn score(dice: [5]u3, category: Category) u32 {
    var dices: [5]u3 = dice;
    std.mem.sort(u3, &dices, {}, comptime std.sort.asc(u3));
    _ = category;
}
