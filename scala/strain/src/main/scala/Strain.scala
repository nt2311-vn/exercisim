object Strain:
  def keep[A](list: List[A], fun: A => Boolean): List[A] =
    list match
      case Nil => Nil
      case head :: tail =>
        if fun(head) then head :: keep(tail, fun)
        else keep(tail, fun)

  def discard[A](list: List[A], fun: A => Boolean): List[A] =
    list match
      case Nil => Nil
      case head :: tail =>
        if fun(head) then discard(tail, fun)
        else head :: discard(tail, fun)
