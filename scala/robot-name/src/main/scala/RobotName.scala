import scala.util.Random
class Robot:
  var name: String = ""
  reset()

  def reset(): Unit =
    name = (Random.alphanumeric.filter(_.isUpper).take(2) ++ Random.alphanumeric
      .filter(_.isDigit)
      .take(3)).mkString
