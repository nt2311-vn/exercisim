class School:
  type DB = Map[Int, Seq[String]]
  private var database: DB = Map.empty

  def add(name: String, g: Int) = ???

  def db: DB = database

  def grade(g: Int): Seq[String] = ???

  def sorted: DB = ???
