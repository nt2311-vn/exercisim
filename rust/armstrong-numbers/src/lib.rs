pub fn is_armstrong_number(num: u32) -> bool {
    let num_str = num.to_string();
    let num_len = num_str.len() as u32;

    let num_vec: Vec<_> = num_str
        .split("")
        .filter(|x| !x.is_empty())
        .map(|x| x.parse::<u32>().unwrap())
        .collect();

    num_vec.iter().map(|num| num.pow(num_len)).sum::<u32>() == num
}
