pub fn factors(mut n: u64) -> Vec<u64> {
    let mut divisors = Vec::new();
    let mut f = 2;

    while n > 1 {
        while n % f == 0 {
            divisors.push(f);
            n /= f;
        }

        f += 1;
    }

    divisors
}
