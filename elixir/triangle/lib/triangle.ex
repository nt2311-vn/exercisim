defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    cond do
      Enum.any?([a <= 0, b <= 0, c <= 0]) -> {:error, "all side lengths must be positive"}
      !proper_lengths?(a, b, c) -> {:error, "side lengths violate triangle inequality"}
      true -> triangle_kind(a, b, c)
    end
  end

  @spec proper_lengths?(number, number, number) :: boolean
  defp proper_lengths?(a, b, c) do
    a + b >= c and a + c >= b and b + c >= a
  end

  @spec triangle_kind(number, number, number) :: {:ok, kind}
  defp triangle_kind(a, b, c) do
    cond do
      a == b and b == c -> {:ok, :equilateral}
      a == b or b == c or c == a -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end
end
