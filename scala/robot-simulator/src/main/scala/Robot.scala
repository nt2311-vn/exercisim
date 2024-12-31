enum Bearing:
  case North, West, South, East

case class Robot(bearing: Bearing, coordinates: (Int, Int)):
  def turnRight: Robot =
    bearing match
      case Bearing.West  => Robot(Bearing.North, coordinates)
      case Bearing.North => Robot(Bearing.East, coordinates)
      case Bearing.East  => Robot(Bearing.South, coordinates)
      case Bearing.South => Robot(Bearing.West, coordinates)

  def turnLeft: Robot =
    bearing match
      case Bearing.West  => Robot(Bearing.South, coordinates)
      case Bearing.South => Robot(Bearing.East, coordinates)
      case Bearing.East  => Robot(Bearing.North, coordinates)
      case Bearing.North => Robot(Bearing.West, coordinates)

  def advance: Robot =
    bearing match
      case Bearing.West =>
        Robot(bearing, (coordinates._1 - 1, coordinates._2))
      case Bearing.North =>
        Robot(bearing, (coordinates._1, coordinates._2 + 1))
      case Bearing.East =>
        Robot(bearing, (coordinates._1 + 1, coordinates._2))
      case Bearing.South =>
        Robot(bearing, (coordinates._1, coordinates._2 - 1))

  def simulate(s: String): Robot =
    var currentRobot = this
    for command <- s do
      currentRobot = command match
        case 'A' => currentRobot.advance
        case 'L' => currentRobot.turnLeft
        case 'R' => currentRobot.turnRight
        case _   => currentRobot

    currentRobot
