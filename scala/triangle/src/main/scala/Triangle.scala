case class Triangle(x: Float, y: Float, z: Float):
  def isTriangle: Boolean =
    x > 0 && y > 0 && z > 0 && x + y >= z && x + z >= y && y + z >= x

  def equilateral: Boolean =
    isTriangle && x == y && x == z

  def isosceles: Boolean =
    isTriangle && (x == y || y == z || z == x)

  def scalene: Boolean =
    isTriangle && !equilateral && !isosceles
