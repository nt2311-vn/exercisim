object SecretHandshake:
  def commands(handshake: Int): List[String] =
    if (handshake == 0) List()
    else
      var binaryStr = handshake.toBinaryString.reverse
      var result: List[String] = List()

      if binaryStr.lift(0).contains('1') then result = result :+ "wink"
      if binaryStr.lift(1).contains('1') then result = result :+ "double blink"
      if binaryStr.lift(2).contains('1') then
        result = result :+ "close your eyes"
      if binaryStr.lift(3).contains('1') then result = result :+ "jump"
      if binaryStr.lift(4).contains('1') then result = result.reverse

      result
