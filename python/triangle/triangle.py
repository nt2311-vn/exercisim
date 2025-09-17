from typing import List


def equilateral(sides):
    [a, b, c] = sides
    return is_triangle(sides) and a == b and b == c


def isosceles(sides):
    [a, b, c] = sides
    return is_triangle(sides) and (a == b or b == c or c == a)


def scalene(sides):
    [a, b, c] = sides
    return is_triangle(sides) and a != b and b != c and c != a


def is_triangle(sides: List[int]) -> bool:
    if sides.__len__() != 3:
        return False

    if any(x <= 0 for x in sides):
        return False

    [a, b, c] = sides

    if a + b < c:
        return False

    if b + c < a:
        return False

    if a + c < b:
        return False

    return True
