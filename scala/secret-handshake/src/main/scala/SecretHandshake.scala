object SecretHandshake:
  def commands(handshake: Int): List[String] =
    handshake match
      case 0 => List()
      case x =>
        var result: List[String] = List()
        val binaryRep = handshake.toBinaryString
        val len = binaryRep.length

        if len >= 1 && binaryRep(len - 1) == '1' then result = result :+ "wink"
        if len >= 2 && binaryRep(len - 2) == '1' then
          result = result :+ "double blink"
        if len >= 3 && binaryRep(len - 3) == '1' then
          result = result :+ "close your eyes"
        if len >= 4 && binaryRep(len - 4) == '1' then result = result :+ "jump"
        if len >= 5 && binaryRep(len - 5) == '1' then result = result.reverse

        result
