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
            for (dice) |val| {
                if (val == dice[0]) {
                    return 50;
                }
            }

            return 0;
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
                if (i == 5) break;
                if (dice[i + 1] - dice[i] != 1) return 0;
                return 30;
            }
        },
    }
}
