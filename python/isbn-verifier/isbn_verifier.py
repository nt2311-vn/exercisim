def is_valid(isbn: str) -> bool:
    if len(isbn) < 9:
        return False

    mutiply_test = range(1, 11)[::-1]
    isbn_numstr: list[int] = []

    for char in isbn:
        if char == " " or char == "-":
            continue

        if char == "X":
            if isbn[-1] != "X":
                return False
            isbn_numstr.append(10)
            continue

        if not char.isdigit():
            return False

        isbn_numstr.append(int(char))

    if len(isbn_numstr) != len(mutiply_test):
        return False

    pairs = zip(isbn_numstr, mutiply_test)

    return sum(int(pair[0]) * pair[1] for pair in pairs) % 11 == 0
