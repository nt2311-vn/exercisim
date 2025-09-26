ALPHABETS = "abcdefghijklmnopqrstuvwxyz"


def is_pangram(sentence: str) -> bool:
    return all(char in sentence.lower() for char in ALPHABETS)
