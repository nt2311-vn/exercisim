// object CollatzConjecture:
//
//   def steps(n: Int): Option[Int] =
//     def findCollat(n: Int, times: Int = 0): Option[Int] =
//       n match
//         case _ if n <= 0 => None
//         case 1           => Some(times)
//         case _ =>
//           if n % 2 == 0 then findCollat(n / 2, times + 1)
//           else findCollat(3 * n + 1, times + 1)
//
//     findCollat(n)

object CollatzConjecture:
  def steps(n: Int): Option[Int] =
    if n <= 0 then None
    else
      var collatz = n
      var times = 0

      while collatz != 1 do
        collatz = if collatz % 2 == 0 then collatz / 2 else 3 * collatz + 1
        times += 1

      Some(times)
