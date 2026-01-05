pub fn factors(n: u64) -> Vec<u64> {
    let mut result: Vec<u64> = Vec::new();
    let mut copy_n = n;

    while copy_n % 2 == 0 {
        result.push(2);
        copy_n /= 2;
    }

    let mut candidate = 3;

    while candidate * candidate <= copy_n {
        while copy_n % candidate == 0 {
            result.push(candidate);
            copy_n /= candidate;
        }

        candidate += 2;
    }

    if copy_n > 1 {
        result.push(copy_n);
    }

    result
}
