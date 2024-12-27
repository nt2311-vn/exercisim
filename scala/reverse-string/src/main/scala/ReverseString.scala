object ReverseString:
  // def reverse(str: String): String = str.reverse
  def reverse(str: String): String =
    str.foldRight("")((char, acc) => acc + char)

  def reverseOperation(chars: List[Char], acc: String): String =
    chars match
      case Nil          => acc
      case head :: tail => reverseOperation(tail, head + acc)
