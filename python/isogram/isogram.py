def is_isogram(string: str) -> bool:
    list_str: list[str] = []

    for char in string.lower():
        if char == " " or char == "-":
            continue

        if len(list_str) == 0:
            list_str.append(char)
        else:
            if char in list_str:
                return False
            else:
                list_str.append(char)

    return True
