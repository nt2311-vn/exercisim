const ascii = @import("std").ascii;
pub const NucleotideError = error{Invalid};

pub const Counts = struct {
    a: u32,
    c: u32,
    g: u32,
    t: u32,
};

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var count = Counts{ .a = 0, .c = 0, .g = 0, .t = 0 };
    for (s) |nuc| {
        const nuc_lower = ascii.toLower(nuc);
        switch (nuc_lower) {
            'a' => count.a += 1,
            'c' => count.c += 1,
            'g' => count.g += 1,
            't' => count.t += 1,
            else => return NucleotideError.Invalid,
        }
    }

    return count;
}
