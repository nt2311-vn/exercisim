object Strain:
  def keep[A](list: Seq[A], bool: A => Boolean): Seq[A] = list.filter(bool)
  def discard[A](list: Seq[A], bool: A => Boolean): Seq[A] =
    list.filterNot(bool)
