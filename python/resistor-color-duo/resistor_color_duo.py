ALL_COLORS = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
]


def value(colors: list[str]) -> int:
    number_value = ""
    for color in colors[:2]:
        if color not in ALL_COLORS:
            raise ValueError("unexpected error of color")

        pos = ALL_COLORS.index(color)

        number_value += str(pos)

    return int(number_value)
