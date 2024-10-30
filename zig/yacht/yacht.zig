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

fn scoreSingle(dices: [5]u3, target: u3) u32 {
    var point: u32 = 0;
    for (dices) |dice| {
        if (dice == target) point += dice;
    }

    return point;
}

fn scoreYatch(dices: [5]u3) u32 {
    return if (dices[0] == dices[1] and dices[1] == dices[2] and dices[2] == dices[3] and dices[3] == dices[4]) 50 else 0;
}

fn scoreLittleStraight(dices: [5]u3) u32 {
    return if (std.mem.eql(u3, dices, [5]u3{ 1, 2, 3, 4, 5 })) 30 else 0;
}

fn scoreBigStraight(dices: [5]u3) u32 {
    return if (std.mem.eql(u3, dices, [5]u3{ 2, 3, 4, 5, 6 })) 30 else 0;
}

pub fn score(dice: [5]u3, category: Category) u32 {
    var dices: [5]u3 = dice;
    std.mem.sort(u3, &dices, {}, comptime std.sort.asc(u3));
    _ = category;
}
