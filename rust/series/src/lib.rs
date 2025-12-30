pub fn series(digits: &str, len: usize) -> Vec<String> {
    let mut result: Vec<String> = Vec::new();
    if digits.len() == 0 || digits.len() < len {
        return result;
    }

    for i in 0..=(digits.len() - len) {
        result.push((digits[i..len + i]).to_string());
    }

    result
}
