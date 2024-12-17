defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    check = is_triangle(a, b, c)
    if check == nil, do: triangle_kind(a, b, c), else: is_triangle(a, b, c)
  end

  @spec is_triangle(number, number, number) :: {:error, String.t()} | nil
  defp is_triangle(a, b, c) do
    cond do
      a <= 0 or b <= 0 or c <= 0 -> {:error, "all side lengths must be positive"}
      a + b < c or a + c < b or b + c < a -> {:error, "side lengths violate triangle inequality"}
      true -> nil
    end
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
