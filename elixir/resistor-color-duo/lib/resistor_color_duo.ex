defmodule ResistorColorDuo do
  @resitor_color %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    colors |> Enum.take(2) |> Enum.map(&color_to_value/1) |> Integer.undigits()
  end

  @spec color_to_value(atom()) :: integer()
  defp color_to_value(color) when is_map_key(@resitor_color, color), do: @resitor_color[color]
end
