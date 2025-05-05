pub fn recite(start_bottles: u32, take_down: u32) -> String {
    (start_bottles - take_down + 1..=start_bottles)
        .rev()
        .map(|verse| {
            let bottle = say_bottle(verse);
            let number = say_number(verse);
            format!(
                "{number} green {bottle} hanging on the wall,\n\
                 {number} green {bottle} hanging on the wall,\n\
                 And if one green bottle should accidentally fall,\n\
                 There'll be {} green {} hanging on the wall.",
                say_number(verse - 1).to_lowercase(),
                say_bottle(verse - 1)
            )
        })
        .collect::<Vec<_>>()
        .join("\n\n")
}

fn say_number(num: u32) -> String {
    match num {
        0 => "no",
        1 => "One",
        2 => "Two",
        3 => "Three",
        4 => "Four",
        5 => "Five",
        6 => "Six",
        7 => "Seven",
        8 => "Eight",
        9 => "Nine",
        10 => "Ten",
        _ => unreachable!(),
    }
    .to_owned()
}

fn say_bottle(num: u32) -> String {
    match num {
        1 => "bottle",
        0 | 2..=10 => "bottles",
        _ => unreachable!(),
    }
    .to_owned()
}
