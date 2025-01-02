object Raindrops:
  def convert(n: Int): String =
    var s: String = ""

    s = if n % 3 == 0 then s"${s}Pling" else s
    s = if n % 5 == 0 then s"${s}Plang" else s
    s = if n % 7 == 0 then s"${s}Plong" else s

    if s.length == 0 then n.toString else s
