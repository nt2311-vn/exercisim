object Etl:
  def transform(scoreMap: Map[Int, Seq[String]]): Map[String, Int] =
    var result: Map[String, Int] = Map()
    for (k, v) <- scoreMap do
      for char <- v do result = result + (char.toLowerCase -> k)

    result
