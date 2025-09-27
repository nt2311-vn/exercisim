def is_valid(isbn: str) -> bool:
    if len(isbn) < 9:
        return False

    cleaned_format = isbn.replace(" ", "").replace("-", "")
    isbn_num: list[int] = []

    for char in cleaned_format:
        if char == "X":
            if cleaned_format[-1] != "X":
                return False
            isbn_num.append(10)
            continue

        if not char.isdigit():
            return False

        isbn_num.append(int(char))

    if len(isbn_num) != len(range(1, 11)):
        return False

    check_pairs = zip(isbn_num, range(1, 11)[::-1])

    return sum(pair[0] * pair[1] for pair in check_pairs) % 11 == 0
