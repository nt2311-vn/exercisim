def steps(number: int) -> int:
    if number <= 0:
        raise ValueError("Only positive integers are allowed")

    if number == 1:
        return 0

    step = 0
    x = number
    while x != 1:
        step += 1

        if x % 2 == 0:
            x = x // 2
        else:
            x = 3 * x + 1

    return step
