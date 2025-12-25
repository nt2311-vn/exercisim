use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut multiples = HashSet::new();

    for &factor in factors {
        if factor == 0 {
            continue;
        }

        for multiple in (factor..limit).step_by(factor as usize) {
            multiples.insert(multiple);
        }
    }

    multiples.iter().sum()
}
