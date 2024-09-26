const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: usize, allergen: Allergen) bool {
    const allergicSet = initAllergenSet(score);
    return allergicSet.contains(allergen);
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var sets: [8]Allergen = undefined;
    var i: usize = 0;

    for (0..8) |index| {
        if ((score & std.math.shl(u8, 1, index)) != 0) {
            sets[i] = @enumFromInt(index);
            i += 1;
        }
    }

    return EnumSet(Allergen).initMany(sets[0..i]);
}
