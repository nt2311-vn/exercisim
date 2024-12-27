object Strain:
  // def keep[A](list: Seq[A], bool: A => Boolean): Seq[A] = list.filter(bool)
  // def discard[A](list: Seq[A], bool: A => Boolean): Seq[A] =
  //   list.filterNot(bool)

  def keep[A](seq: Seq[A], func: A => Boolean): Seq[A] =
    seq match
      case Nil => Nil
      case head :: tail =>
        if func(head) then head +: keep(tail, func)
        else keep(tail, func)

  def discard[A](seq: Seq[A], func: A => Boolean): Seq[A] =
    seq match
      case Nil => Nil
      case head :: tail =>
        if func(head) then discard(tail, func)
        else head +: discard(tail, func)
