pub fn egg_count(display_value: u32) -> usize {
    let bit_str: String = format!("{:b}", display_value);

    bit_str.chars().filter(|x| *x == '1').count()
}
