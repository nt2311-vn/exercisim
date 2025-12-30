pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack = Vec::new();

    for x in string.chars() {
        match x {
            '[' | '{' | '(' => stack.push(x),
            ']' => {
                if stack.pop() != Some('[') {
                    return false;
                }
            }
            '}' => {
                if stack.pop() != Some('{') {
                    return false;
                }
            }
            ')' => {
                if stack.pop() != Some('(') {
                    return false;
                }
            }
            _ => (),
        }
    }

    stack.is_empty()
}
