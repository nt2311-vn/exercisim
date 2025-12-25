def square(number: int) -> int:
    if number <= 0 or number > 64:
        raise ValueError("square must be between 1 and 64")

    return 2 ** (number - 1)


def total() -> int:
    sum = 0

    for n in range(1, 65):
        sum += square(n)

    return sum
