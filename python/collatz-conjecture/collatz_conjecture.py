def steps(number: int, count: int = 0) -> int:
    if number <= 0:
        raise ValueError("Only positive integers are allowed")

    if number == 1:
        return count

    if number % 2 == 0:
        return steps(number // 2, count + 1)

    return steps(3 * number + 1, count + 1)
