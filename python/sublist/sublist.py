"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
SUBLIST = "SUBLIST"
SUPERLIST = "SUPERLIST"
EQUAL = "EQUAL"
UNEQUAL = "UNEQUAL"


def sublist(list_one: list[int], list_two: list[int]) -> str:
    if len(list_one) == len(list_two):
        if all(list_two[i] == num for i, num in enumerate(list_one)):
            return EQUAL

        return UNEQUAL

    if list_one == []:
        return SUBLIST

    if list_two == []:
        return SUPERLIST

    if len(list_one) < len(list_two):
        if list_one[0] not in list_two:
            return UNEQUAL

        index_in_other = list_two.index(list_one[0])

        if all(
            list_one[i] == num
            for i, num in enumerate(list_two[index_in_other : len(list_one)])
        ):
            return SUBLIST

        return UNEQUAL

    if list_two[0] not in list_one:
        return UNEQUAL
    first_index = list_one.index(list_two[0])
    if all(
        list_two[i] == num
        for i, num in enumerate(list_one[first_index : len(list_two)])
    ):
        return SUPERLIST
    return UNEQUAL
