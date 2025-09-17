def leap_year(year: int) -> bool:
    """
    Function to return boolean value if provided year is a leap year

    :param year: int -the provided year
    :return: int - whether provided year is leap year or not
    """

    return year % 4 == 0 and year % 100 != 0 or year % 400 == 0
