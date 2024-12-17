defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(1), do: 1

  def calculate(radicand) do
    binary_search(0, radicand, radicand)
  end

  defp binary_search(low, high, num) do
    mid = div(low + high, 2)
    square = mid * mid

    cond do
      square == num -> mid
      square < num -> binary_search(mid + 1, high, num)
      square > num -> binary_search(low, mid - 1, num)
    end
  end
end
