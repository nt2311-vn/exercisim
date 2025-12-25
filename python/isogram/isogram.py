def is_isogram(string: str) -> bool:
    acc_str = ""
    not_word_count = 0

    for char in string.lower():
        if char == " " or char == "-":
            not_word_count += 1
            continue

        if char in acc_str:
            continue
        else:
            acc_str += char

    return len(acc_str) + not_word_count == len(string)
