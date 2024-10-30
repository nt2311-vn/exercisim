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
    return if (std.mem.eql(u3, &dices, &[5]u3{ 1, 2, 3, 4, 5 })) 30 else 0;
}

fn scoreBigStraight(dices: [5]u3) u32 {
    return if (std.mem.eql(u3, &dices, &[5]u3{ 2, 3, 4, 5, 6 })) 30 else 0;
}

fn scoreFullHouse(dices: [5]u3) u32 {
    if (dices[0] == dices[1] and dices[2] == dices[3] and dices[3] == dices[4] and dices[1] != dices[2] or dices[0] == dices[1] and dices[1] == dices[2] and dices[3] == dices[3] and dices[2] != dices[3]) return sum(dices);

    return 0;
}

fn scoreFourKind(dices: [5]u3) u32 {
    return if (dices[0] == dices[3] or dices[1] == dices[4]) 4 * @as(u32, @intCast(dices[1])) else 0;
}

pub fn score(dice: [5]u3, category: Category) u32 {
    var dices: [5]u3 = dice;
    std.mem.sort(u3, &dices, {}, comptime std.sort.asc(u3));

    return switch (category) {
        .ones => scoreSingle(dices, 1),
        .twos => scoreSingle(dices, 2),
        .threes => scoreSingle(dices, 3),
        .fours => scoreSingle(dices, 4),
        .fives => scoreSingle(dices, 5),
        .sixes => scoreSingle(dices, 6),
        .full_house => scoreFullHouse(dices),
        .four_of_a_kind => scoreFourKind(dices),
        .little_straight => scoreLittleStraight(dices),
        .big_straight => scoreBigStraight(dices),
        .choice => sum(dices),
        .yacht => scoreYatch(dices),
    };
}
