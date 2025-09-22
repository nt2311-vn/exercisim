def is_question(msg: str) -> bool:
    return msg.strip().endswith("?")


def is_yell(msg: str) -> bool:
    return msg.upper() == msg and msg.lower() != msg


def is_silence(msg: str) -> bool:
    return len(msg.strip()) == 0


def response(hey_bob: str) -> str:
    if is_question(hey_bob) and is_yell(hey_bob):
        return "Calm down, I know what I'm doing!"

    if is_silence(hey_bob):
        return "Fine. Be that way!"

    if is_question(hey_bob):
        return "Sure."

    if is_yell(hey_bob):
        return "Whoa, chill out!"

    return "Whatever."
