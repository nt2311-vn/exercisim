pub fn recite(start_bottles: u32, take_down: u32) -> String {
    let mut poem = vec![];
    for i in (start_bottles.saturating_sub(take_down - 1)..=start_bottles).rev() {
        poem.push(verses(i));
    }
    poem.join("\n\n").trim().to_string()
}

fn verses(bottle_number: u32) -> String {
    match bottle_number {
        0 => String::new(),
        1 => concat!(
            "One green bottle hanging on the wall,\n",
            "One green bottle hanging on the wall,\n",
            "And if one green bottle should accidentally fall,\n",
            "There'll be no green bottles hanging on the wall."
        ).trim().to_string(),
        n => format!(
            "{} green bottles hanging on the wall,\n{} green bottles hanging on the wall,\nAnd if one green bottle should accidentally fall,\nThere'll be {} green {} hanging on the wall.",
            title_count_number(n),
            title_count_number(n),
            count_number(n - 1),
            plurals(n - 1)
        ).trim().to_string(),
    }
}

fn plurals(bottle_number: u32) -> String {
    match bottle_number {
        1 => String::from("bottle"),
        _ => String::from("bottles"),
    }
}

fn count_number(bottle_number: u32) -> String {
    match bottle_number {
        0 => String::from("no"),
        1 => String::from("one"),
        2 => String::from("two"),
        3 => String::from("three"),
        4 => String::from("four"),
        5 => String::from("five"),
        6 => String::from("six"),
        7 => String::from("seven"),
        8 => String::from("eight"),
        9 => String::from("nine"),
        10 => String::from("ten"),
        _ => String::from(""),
    }
}

fn title_count_number(bottle_number: u32) -> String {
    match bottle_number {
        0 => String::from("No"),
        1 => String::from("One"),
        2 => String::from("Two"),
        3 => String::from("Three"),
        4 => String::from("Four"),
        5 => String::from("Five"),
        6 => String::from("Six"),
        7 => String::from("Seven"),
        8 => String::from("Eight"),
        9 => String::from("Nine"),
        10 => String::from("Ten"),
        _ => String::from(""),
    }
}
