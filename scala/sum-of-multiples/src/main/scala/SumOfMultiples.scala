object SumOfMultiples:
  def sum(factors: Set[Int], limit: Int): Int =
    var uniqueMul: Set[Int] = Set()

    for
      factor <- factors if factor != 0
      num <- (1 until limit) if num % factor == 0
    yield uniqueMul = uniqueMul + num

    uniqueMul.foldLeft(0)(_ + _)
