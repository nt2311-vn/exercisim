defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """

  @type ohm_label :: :ohms | :kiloohms | :megaohms | :gigaohms
  @resitor_colors %{
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

  @giga 1_000_000_000
  @mega 1_000_000
  @kilo 1_000

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    # [first, second, third] = Enum.take(colors, 3)
    #
    # combination = calc_combination(first, second)
    #
    # case third do
    #   :black ->
    #     {combination, :ohms}
    #
    #   :brown ->
    #     {combination * 10, :ohms}
    #
    #   :red ->
    #     case second do
    #       :black -> {color_to_num(first), :kiloohms}
    #       true -> {combination * 100, :ohms}
    #     end
    #
    #   :orange ->
    #     {combination, :kiloohms}
    #
    #   :yellow ->
    #     {combination * 10, :kiloohms}
    #
    #   :green ->
    #     case second do
    #       :black -> {color_to_num(first), :megaohms}
    #       true -> {combination * 100, :kiloohms}
    #     end
    #
    #   :blue ->
    #     {combination, :megaohms}
    #
    #   :violet ->
    #     {combination * 10, :megaohms}
    #
    #   :grey ->
    #     case second do
    #       :black -> {color_to_num(first), :gigaohms}
    #       true -> {combination * 100, :megaohms}
    #     end
    #
    #   :white ->
    #     {combination, :gigaohms}
    # end

    colors = Enum.take(colors, 3)
    colors |> resitor_value |> value_to_ohms(color_to_value(List.last(colors))) |> ohms_to_label
  end

  defp resitor_value(colors) do
    colors |> Enum.take(2) |> Enum.map(&color_to_value/1) |> Integer.undigits()
  end

  @spec color_to_value(atom()) :: integer()
  defp color_to_value(color) when is_map_key(@resitor_colors, color), do: @resitor_colors[color]

  @spec value_to_ohms(integer(), integer()) :: integer()
  defp value_to_ohms(val, magnitude), do: val * 10 ** magnitude

  @spec ohms_to_label(integer()) :: {number, ohm_label()}
  defp ohms_to_label(val) do
    cond do
      val >= @giga -> {div(val, @giga), :gigaohms}
      val >= @mega -> {div(val, @mega), :megaohms}
      val >= @kilo -> {div(val, @kilo), :kiloohms}
      true -> {val, :ohms}
    end
  end

  # @spec color_to_num(atom()) :: integer()
  # defp color_to_num(color) do
  #   case color do
  #     :black -> 0
  #     :brown -> 1
  #     :red -> 2
  #     :orange -> 3
  #     :yellow -> 4
  #     :green -> 5
  #     :blue -> 6
  #     :violet -> 7
  #     :grey -> 8
  #     :white -> 9
  #   end
  # end
  #
  # @spec calc_combination(atom(), atom()) :: integer()
  # defp calc_combination(color1, color2) do
  #   color_to_num(color1) * 10 + color_to_num(color2)
  # end
end
