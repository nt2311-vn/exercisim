pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    const half: u64 = n / 2;
    var sum: u64 = 0;
    for (1..half + 1) |num| {
        if (n % num == 0) {
            sum += num;
        }
    }

    // if (sum == n) {
    //     return Classification.perfect;
    // }
    //
    // return if (sum > n) Classification.abundant else Classification.deficient;

    if (n == sum) {
        return Classification.perfect;
    }

    return if (n > sum) Classification.deficient else Classification.abundant;
}
