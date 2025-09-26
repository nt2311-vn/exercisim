ALPHABETS = "abcdefghijklmnopqrstuvwxyz"


def is_pangram(sentence: str) -> bool:
    for char in ALPHABETS:
        if char not in sentence.lower():
            return False

    return True
