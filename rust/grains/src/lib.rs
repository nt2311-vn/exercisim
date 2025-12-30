pub fn square(s: u32) -> u64 {
    if s == 0 {
        panic!("cannot power to exponent of zero");
    }

    2u64.pow(s - 1)
}

pub fn total() -> u64 {
    (1..=64).into_iter().map(|exp| square(exp)).sum()
}
