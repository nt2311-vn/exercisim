const fmt = @import("std").fmt;
pub const ColorBand = enum {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};

fn getColorVal(color: ColorBand) usize {
    return switch (color) {
        ColorBand.black => 0,
        ColorBand.brown => 1,
        ColorBand.red => 2,
        ColorBand.orange => 3,
        ColorBand.yellow => 4,
        ColorBand.green => 5,
        ColorBand.blue => 6,
        ColorBand.violet => 7,
        ColorBand.grey => 8,
        ColorBand.white => 9,
    };
}

pub fn colorCode(colors: [2]ColorBand) usize {
    const val1 = getColorVal(colors[0]);
    const val2 = getColorVal(colors[1]);
    return val1 * 10 + val2;
}
