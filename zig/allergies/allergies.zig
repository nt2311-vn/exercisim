const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum(u8) {
    eggs = 1,
    peanuts = 2,
    shellfish = 4,
    strawberries = 8,
    tomatoes = 16,
    chocolate = 32,
    pollen = 64,
    cats = 128,
};

pub fn isAllergicTo(score: usize, allergen: Allergen) bool {
    return @intFromEnum(allergen) & score != 0;
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var allergens = EnumSet(Allergen).initFull();
    var allergenIter = allergens.iterator();

    while (allergenIter.next()) |allergen| {
        const isAllergic = isAllergicTo(score, allergen);
        allergens.setPresent(allergen, isAllergic);
    }

    return allergens;
}
