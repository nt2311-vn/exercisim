trait TriClass:
  def isTriangle(x: Float, y: Float, z: Float): Boolean =
    x > 0 && y > 0 && z > 0 && x + y >= z && x + z >= y && y + z >= x

  def equilateral(x: Float, y: Float, z: Float): Boolean =
    isTriangle(x, y, z) && x == y && x == z

  def isosceles(x: Float, y: Float, z: Float): Boolean =
    isTriangle(x, y, z) && (x == y || y == z || z == x)

  def scalene(x: Float, y: Float, z: Float): Boolean =
    isTriangle(x, y, z) && !equilateral(x, y, z) && !isosceles(x, y, z)

case class Triangle(x: Float, y: Float, z: Float) extends TriClass:
  def equilateral: Boolean = super.equilateral(x, y, z)
  def isosceles: Boolean = super.isosceles(x, y, z)
  def scalene: Boolean = super.scalene(x, y, z)

  // def isTriangle: Boolean =
  //   x > 0 && y > 0 && z > 0 && x + y >= z && x + z >= y && y + z >= x

  // def equilateral: Boolean =
  //   isTriangle && x == y && x == z
  //
  // def isosceles: Boolean =
  //   isTriangle && (x == y || y == z || z == x)
  //
  // def scalene: Boolean =
  //   isTriangle && !equilateral && !isosceles
