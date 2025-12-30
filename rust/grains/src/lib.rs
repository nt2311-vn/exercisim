pub fn square(s: u32) -> u64 {
    if s == 0 {
        panic!("cannot power to exponent of zero");
    }

    2u64.pow(s - 1)
}

pub fn total() -> u64 {
    let mut sum: u64 = 0;
    for n in 0..=63 {
        sum += 2u64.pow(n);
    }

    sum
}
