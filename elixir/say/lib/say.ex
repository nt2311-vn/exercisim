defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number not in 0..999_999_999_999 do
    {:error, "number is out of range"}
  end

  def in_english(number) do
    {:ok, format_number(number)}
  end

  defp format_number(0), do: "zero"
  defp format_number(1), do: "one"
  defp format_number(2), do: "two"
  defp format_number(3), do: "three"
  defp format_number(4), do: "four"
  defp format_number(5), do: "five"
  defp format_number(6), do: "six"
  defp format_number(7), do: "seven"
  defp format_number(8), do: "eight"
  defp format_number(9), do: "nine"
  defp format_number(10), do: "ten"
  defp format_number(11), do: "eleven"
  defp format_number(12), do: "twelve"
  defp format_number(13), do: "thirteen"
  defp format_number(15), do: "fifteen"
  defp format_number(18), do: "eighteen"
  defp format_number(20), do: "twenty"
  defp format_number(30), do: "thirty"
  defp format_number(40), do: "forty"
  defp format_number(50), do: "fifty"
  defp format_number(80), do: "eighty"

  defp format_number(number) when number < 20 do
    "#{format_number(number - 10)}teen"
  end

  defp format_number(number) when number < 100 do
    case rem(number, 10) do
      0 -> "#{format_number(div(number, 10))}ty"
      low -> "#{format_number(number - low)}-#{format_number(low)}"
    end
  end

  defp format_number(number) when number < 1000 do
    format_number(number, 100, "hundred")
  end

  defp format_number(number) when number < 1_000_000 do
    format_number(number, 1000, "thousand")
  end

  defp format_number(number) when number < 1_000_000_000 do
    format_number(number, 1_000_000, "million")
  end

  defp format_number(number) do
    format_number(number, 1_000_000_000, "billion")
  end

  defp format_number(number, base, word) do
    high = div(number, base)
    low = rem(number, base)

    case low do
      0 -> "#{format_number(high)} #{word}"
      low -> "#{format_number(high)} #{word} #{format_number(low)}"
    end
  end
end
