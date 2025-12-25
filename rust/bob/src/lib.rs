pub fn reply(message: &str) -> &str {
    if is_silence(message) {
        return "Fine. Be that way!";
    }

    if is_uppercase(message) && is_question(message) {
        return "Calm down, I know what I'm doing!";
    }

    if is_uppercase(message) {
        return "Whoa, chill out!";
    }

    if is_question(message) {
        return "Sure.";
    }

    "Whatever."
}

fn is_uppercase(message: &str) -> bool {
    message.to_uppercase() == message && message.to_lowercase() != message
}

fn is_question(message: &str) -> bool {
    message.trim().ends_with("?")
}

fn is_silence(message: &str) -> bool {
    message.trim() == ""
}
