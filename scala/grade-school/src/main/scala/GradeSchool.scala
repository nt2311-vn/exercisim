class School:
  type DB = Map[Int, Seq[String]]
  private var database: DB = Map()

  def add(name: String, g: Int) =
    database = database + (g -> (database.getOrElse(g, Seq()) :+ name))

  def db: DB = database

  def grade(g: Int): Seq[String] =
    database.getOrElse(g, Seq())

  def sorted: DB =
    database.view.mapValues(_.sorted).toSeq.sortBy(_._1).toMap
