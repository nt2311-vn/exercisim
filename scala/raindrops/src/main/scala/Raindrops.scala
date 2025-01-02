object Raindrops:
  def convert(n: Int): String =
    // var s: String = ""

    // s = if n % 3 == 0 then s"${s}Pling" else s
    // s = if n % 5 == 0 then s"${s}Plang" else s
    // s = if n % 7 == 0 then s"${s}Plong" else s
    //
    // if s.length == 0 then n.toString else s

    n match
      case _ if n % 3 == 0 && n % 5 == 0 && n % 7 == 0 => "PlingPlangPlong"
      case _ if n % 3 == 0 && n % 5 == 0               => "PlingPlang"
      case _ if n % 5 == 0 && n % 7 == 0               => "PlangPlong"
      case _ if n % 3 == 0 && n % 7 == 0               => "PlingPlong"
      case _ if n % 3 == 0                             => "Pling"
      case _ if n % 5 == 0                             => "Plang"
      case _ if n % 7 == 0                             => "Plong"
      case _                                           => n.toString
