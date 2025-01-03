object CollatzConjecture:

  def steps(n: Int): Option[Int] =
    def findCollat(n: Int, times: Int = 0): Option[Int] =
      n match
        case _ if n <= 0 => None
        case 1           => Some(times)
        case _ =>
          if n % 2 == 0 then findCollat(n / 2, times + 1)
          else findCollat(3 * n + 1, times + 1)

    findCollat(n)
