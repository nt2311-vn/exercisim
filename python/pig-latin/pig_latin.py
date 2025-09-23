def _rotate(word: str) -> str:
    return word[1:] + word[0]


def _pig_latin(word: str) -> str:
    if word[:2] == "xr":
        return "xrayay"

    if word[0] == "y" and word[1] in "aeiou":
        word = _rotate(word)

    while word[0] not in "aeiouy":
        word = _rotate(word)

    if word[-1] == "q" and word[0] == "u":
        word = _rotate(word)

    return word + "ay"


def translate(text: str) -> str:
    return " ".join(_pig_latin(word) for word in text.split())
