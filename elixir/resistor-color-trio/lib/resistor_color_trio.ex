defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    [first, second, third] = Enum.take(colors, 3)

    combination = calc_combination(first, second)

    case third do
      :black ->
        {combination, :ohms}

      :brown ->
        {combination * 10, :ohms}

      :red ->
        case second do
          :black -> {color_to_num(first), :kiloohms}
          true -> {combination * 100, :ohms}
        end

      :orange ->
        {combination, :kiloohms}

      :yellow ->
        {combination * 10, :kiloohms}

      :green ->
        case second do
          :black -> {color_to_num(first), :megaohms}
          true -> {combination * 100, :kiloohms}
        end

      :blue ->
        {combination, :megaohms}

      :violet ->
        {combination * 10, :megaohms}

      :grey ->
        case second do
          :black -> {color_to_num(first), :gigaohms}
          true -> {combination * 100, :megaohms}
        end

      :white ->
        {combination, :gigaohms}
    end
  end

  @spec color_to_num(atom()) :: integer()
  defp color_to_num(color) do
    case color do
      :black -> 0
      :brown -> 1
      :red -> 2
      :orange -> 3
      :yellow -> 4
      :green -> 5
      :blue -> 6
      :violet -> 7
      :grey -> 8
      :white -> 9
    end
  end

  @spec calc_combination(atom(), atom()) :: integer()
  defp calc_combination(color1, color2) do
    color_to_num(color1) * 10 + color_to_num(color2)
  end
end
