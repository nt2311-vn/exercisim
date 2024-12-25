defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert([], _, _), do: {:ok, [0]}
  def convert([0 | rest], input_base, output_base), do: convert(rest, input_base, output_base)

  def convert(digits, input_base, output_base) do
    if Enum.any?(digits, fn x -> x < 0 || x >= input_base end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      output_digit = digits_to_integer(digits, input_base) |> integer_to_digits(output_base, [])
      {:ok, output_digit}
    end
  end

  defp digits_to_integer(digits, input_base) do
    Enum.reduce(digits, 0, fn digit, acc -> acc * input_base + digit end)
  end

  defp integer_to_digits(0, _, acc), do: acc

  defp integer_to_digits(value, output_base, acc) do
    integer_to_digits(div(value, output_base), output_base, [rem(value, output_base) | acc])
  end
end
