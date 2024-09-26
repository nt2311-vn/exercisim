// Import the appropriate standard library and modules
const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rna = try allocator.alloc(u8, dna.len);
    errdefer allocator.free(rna);

    for (dna, 0..) |nuc, i| {
        switch (nuc) {
            'A' => rna[i] = 'U',
            'G' => rna[i] = 'C',
            'C' => rna[i] = 'G',
            'T' => rna[i] = 'A',
            else => {},
        }
    }

    return rna;
}
