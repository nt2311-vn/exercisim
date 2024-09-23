const fmt = @import("std").fmt;
pub const ColorBand = enum(u8) {
    black = 0,
    brown = 1,
    red = 2,
    orange = 3,
    yellow = 4,
    green = 5,
    blue = 6,
    violet = 7,
    grey = 8,
    white = 9,
};

pub fn colorCode(colors: [2]ColorBand) usize {
    const color_val_1 = @intFromEnum(colors[0]);
    const color_val_2 = @intFromEnum(colors[1]);

    return color_val_1 * 10 + color_val_2;
}
