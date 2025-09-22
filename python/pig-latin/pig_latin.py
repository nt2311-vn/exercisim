VOWELS = ["a", "e", "i", "o", "u"]


def translate(text: str) -> str:
    return " ".join(translate_words(word) for word in text.split())


def translate_words(word: str) -> str:
    for rule in (latin_rule1, latin_rule2):
        result = rule(word)
        if result != word:
            return result

    return word


def latin_rule1(text: str) -> str:
    if text[0] in VOWELS or text.startswith(("xr", "yt")):
        return f"{text}ay"

    return text


def latin_rule2(text: str) -> str:
    consonant_prefix = ""
    i = 0
    while i < len(text):
        char = text[i]

        # vowel rule
        if char in VOWELS or (char == "y" and i > 0):
            break

        # treat "qu" as a unit
        if char == "q" and i + 1 < len(text) and text[i + 1] == "u":
            consonant_prefix += "qu"
            i += 2
            continue

        consonant_prefix += char
        i += 1

    if not consonant_prefix:
        return text
    rest = text[len(consonant_prefix) :]
    return f"{rest}{consonant_prefix}ay"
