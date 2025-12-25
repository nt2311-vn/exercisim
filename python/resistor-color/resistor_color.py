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


def colors() -> list[str]:
    return ALL_COLORS
