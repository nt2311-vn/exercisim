ALPHABETS = "abcdefghijklmnopqrstuvwxyz"


def rotate(text: str, key: int) -> str:
    result = ""
    for word in text.split():
        result += _convert(word, key)
        result += " "

    return result[:-1]


def _convert(word: str, key: int) -> str:
    encrypted = ""

    for char in word:
        if not char.isalpha():
            encrypted += char
        else:
            if char.isupper():
                encrypted_pos = (ALPHABETS.index(char.lower()) + key) % 26
                encrypted += ALPHABETS[encrypted_pos].upper()
            else:
                encrypted_pos = (ALPHABETS.index(char) + key) % 26
                encrypted += ALPHABETS[encrypted_pos]

    return encrypted
