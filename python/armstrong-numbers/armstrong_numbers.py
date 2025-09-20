def is_armstrong_number(number: int) -> bool:
    num_str = str(number)
    num_len = len(num_str)
    if num_len == 1:
        return True

    char_list = list(num_str)
    total = 0

    for char_num in char_list:
        total += int(char_num) ** num_len

    return total == number
