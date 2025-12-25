def convert(number: int) -> str:
    if number % 3 == 0 and number % 5 != 0 and number % 7 != 0:
        return "Pling"

    if number % 5 == 0 and number % 3 != 0 and number % 7 != 0:
        return "Plang"

    if number % 7 == 0 and number % 3 != 0 and number % 5 != 0:
        return "Plong"

    if number % 15 == 0 and number % 7 != 0:
        return "PlingPlang"

    if number % 21 == 0 and number % 5 != 0:
        return "PlingPlong"

    if number % 35 == 0 and number % 3 != 0:
        return "PlangPlong"

    if number % 105 == 0:
        return "PlingPlangPlong"

    return f"{number}"
