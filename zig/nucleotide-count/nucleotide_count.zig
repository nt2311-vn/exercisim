// const ascii = @import("std").ascii;
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
        switch (nuc) {
            'A' => count.a += 1,
            'C' => count.c += 1,
            'G' => count.g += 1,
            'T' => count.t += 1,
            else => return NucleotideError.Invalid,
        }
    }

    return count;
}
