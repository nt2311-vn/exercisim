object Bob:
  def yell(msg: String): Boolean =
    msg.toUpperCase == msg && msg.toLowerCase != msg

  def question(msg: String): Boolean =
    msg.trim.endsWith("?")

  def yellAndQuestion(msg: String): Boolean =
    yell(msg) && question(msg)

  def silence(msg: String): Boolean =
    msg.trim == ""

  def response(msg: String): String =
    // if yellAndQuestion(msg) then "Calm down, I know what I'm doing!"
    // else if yell(msg) then "Whoa, chill out!"
    // else if question(msg) then "Sure."
    // else if silence(msg) then "Fine. Be that way!"
    // else "Whatever."
    msg.trim match
      case _ if yellAndQuestion(msg) => "Calm down, I know what I'm doing!"
      case _ if yell(msg)            => "Whoa, chill out!"
      case _ if question(msg)        => "Sure."
      case _ if silence(msg)         => "Fine. Be that way!"
      case _                         => "Whatever."
