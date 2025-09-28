def classify(number: int) -> str:
    """A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """

    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")

    if number == 1:
        return "deficient"

    compare = number - aliquot_sum(number)
    print(aliquot_sum(number))
    if compare == 0:
        return "perfect"

    if compare > 0:
        return "deficient"

    return "abundant"


def aliquot_sum(number: int) -> int:
    max_aliquot = number // 2
    return sum(num for num in range(2, max_aliquot + 1) if number % num == 0) + 1
