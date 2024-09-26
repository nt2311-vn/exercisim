const std = @import("std");
const RanGen = std.rand.DefaultPrng;
pub fn modifier(score: i8) i8 {
    return @divFloor((score - 10), 2);
}

pub fn ability() i8 {
    const seed: u64 = @bitCast(std.time.timestamp());
    var rnd: std.rand.Xoshiro256 = RanGen.init(seed);
    const n1 = rnd.random().intRangeLessThan(i8, 1, 7);
    const n2 = rnd.random().intRangeLessThan(i8, 1, 7);
    const n3 = rnd.random().intRangeLessThan(i8, 1, 7);
    const n4 = rnd.random().intRangeLessThan(i8, 1, 7);

    const arr: []const i8 = &[4]i8{ n1, n2, n3, n4 };

    var min_num: i8 = 7;
    for (arr) |dice| {
        if (dice < min_num) {
            min_num = dice;
        }
    }

    return n1 + n2 + n3 + n4 - min_num;
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const strength = ability();
        const dexterity = ability();
        const constitution = ability();
        const intelligence = ability();
        const wisdom = ability();
        const charisma = ability();
        const hitpoints = 10 + modifier(constitution);

        return Character{ .strength = strength, .dexterity = dexterity, .constitution = constitution, .intelligence = intelligence, .wisdom = wisdom, .charisma = charisma, .hitpoints = hitpoints };
    }
};
