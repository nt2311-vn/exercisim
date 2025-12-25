pub fn square_of_sum(n: u32) -> u32 {
    let sum = (1..=n).sum::<u32>();
    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    let mut sum: u32 = 0;

    for num in 1..=n {
        sum += num * num;
    }

    sum
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
