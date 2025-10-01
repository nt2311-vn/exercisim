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


def color_code(color: str) -> int:
    if color not in ALL_COLORS:
        raise ValueError("unexpected color value")

    return ALL_COLORS.index(color)


def value(colors: list[str]) -> int:
    return int("".join([str(color_code(color)) for color in colors[:2]]))
