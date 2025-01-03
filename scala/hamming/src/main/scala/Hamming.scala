object Hamming:
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] =
    val diff = dnaStrandTwo.length - dnaStrandOne.length
    diff match
      case 0 =>
        val dist = dnaStrandTwo
          .zip(dnaStrandOne)
          .count({ case (nucTwo, nucOne) => nucTwo != nucOne })
        Some(dist)
      case _ => None
