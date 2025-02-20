defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    random_num = :rand.uniform(9000) + 999
    "NCC-#{random_num}"
  end

  def random_stardate() do
    41000.0 + :rand.uniform() * 1000.0
  end

  def format_stardate(stardate) when is_float(stardate),
    do: Float.round(stardate, 1) |> Float.to_string()

  def format_stardate(stardate), do: :io_lib.format("~.1f", [stardate]) |> to_string()
end
