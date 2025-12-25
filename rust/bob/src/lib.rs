pub fn reply(message: &str) -> &str {
    match message.trim() {
        m if is_silence(m) => "Fine. Be that way!",
        m if is_question(m) && is_uppercase(m) => "Calm down, I know what I'm doing!",
        m if is_question(m) => "Sure.",
        m if is_uppercase(m) => "Whoa, chill out!",
        _ => "Whatever.",
    }
}

fn is_uppercase(message: &str) -> bool {
    message.to_uppercase() == message && message.to_lowercase() != message
}

fn is_question(message: &str) -> bool {
    message.ends_with("?")
}

fn is_silence(message: &str) -> bool {
    message.is_empty()
}
