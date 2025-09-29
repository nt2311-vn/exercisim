def rebase(input_base: int, digits: list[int], output_base: int) -> list[int]:
    if input_base < 2:
        raise ValueError("input base must be >= 2")

    if output_base < 2:
        raise ValueError("output base must be >= 2")

    if any(digit < 0 or digit >= input_base for digit in digits):
        raise ValueError("all digits must satisfy 0 <= d < input base")

    base_number = _base_to_number(input_base, digits)
    return _number_to_base(base_number, output_base)


def _base_to_number(base: int, digits: list[int]) -> int:
    multiply_range = range(0, len(digits))[::-1]

    return sum(digit * (base**pw) for pw, digit in zip(multiply_range, digits))


def _number_to_base(number: int, base: int) -> list[int]:
    if number == 0:
        return [0]

    digits = []
    while number:
        digits.append(int(number % base))
        number //= base

    return digits[::-1]
