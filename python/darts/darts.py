def score(x: int, y: int) -> int:
    parameter_square = x * x + y * y

    if parameter_square <= 1:
        return 10

    if parameter_square <= 25:
        return 5

    if parameter_square <= 100:
        return 1

    return 0


# def position(x: int, y: int) -> float:
#     return (x * x + y * y) ** 0.5
