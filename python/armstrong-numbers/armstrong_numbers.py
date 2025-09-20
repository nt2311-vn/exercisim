def is_armstrong_number(number: int) -> bool:
    num_str = str(number)
    num_len = len(num_str)
    if num_len == 1:
        return True

    return sum(int(char_num) ** num_len for char_num in list(num_str)) == number
