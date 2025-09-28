def score(x: int, y: int) -> int:
    pos = position(x, y)

    if pos <= 1.0:
        return 10

    if pos <= 5.0:
        return 5

    if pos <= 10.0:
        return 1

    return 0


def position(x: int, y: int) -> float:
    return (x * x + y * y) ** 0.5
