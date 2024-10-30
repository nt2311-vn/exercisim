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

pub fn score(dice: [5]u3, category: Category) u32 {
    switch (category) {
        .yacht => {
            var count: u8 = 0;
            for (dice) |val| {
                if (val == dice[4]) {
                    count += 1;
                }
            }

            return if (count == 5) 50 else 0;
        },
        .choice => {
            var sum: u32 = 0;

            for (dice) |val| {
                sum += val;
            }

            return sum;
        },

        .big_straight, .little_straight => {
            for (dice, 0..) |_, i| {
                if (i == 4) break;
                if (dice[i + 1] - dice[i] != 1) return 0;
                return 30;
            }
        },

        .four_of_a_kind => {
            var same: u8 = 0;
            for (dice, 0..) |_, i| {
                if (i == 4) break;
                if (dice[i] == dice[i + 1]) {
                    same += 1;
                }
            }

            return if (same == 4) 16 else 0;
        },

        .full_house => {
            const first_same: u32 = dice[0];
            var second_same: u32 = 0;
            var first_count: u8 = 0;
            var second_count: u8 = 0;

            for (dice) |val| {
                if (val == first_same) continue;
                second_same = val;
            }

            for (dice) |val| {
                if (val == first_same) {
                    first_count += 1;
                }
                if (val == second_same) {
                    second_count += 1;
                }
            }

            if (first_count == 3 and second_count == 2) return 3 * first_same + 2 * second_same;
            if (first_count == 2 and second_count == 3) return 3 * second_same + 2 * first_same;

            return 0;
        },

        .ones => {
            var point: u32 = 0;
            for (dice) |val| {
                if (val == 1) point += 1;
            }

            return point;
        },

        .twos => {
            var point: u32 = 0;
            for (dice) |val| {
                if (val == 2) point += 2;
            }

            return point;
        },

        .threes => {
            var point: u32 = 0;
            for (dice) |val| {
                if (val == 3) point += 3;
            }

            return point;
        },

        .fours => {
            var point: u32 = 0;
            for (dice) |val| {
                if (val == 4) point += 4;
            }

            return point;
        },

        .fives => {
            var point: u32 = 0;
            for (dice) |val| {
                if (val == 5) point += 5;
            }

            return point;
        },

        .sixes => {
            var point: u32 = 0;
            for (dice) |val| {
                if (val == 6) point += 6;
            }

            return point;
        },
    }

    return 0;
}
