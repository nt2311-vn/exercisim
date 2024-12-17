defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(1), do: 1

  def calculate(radicand) do
    binary_search(0, radicand, radicand)
  end

  @spec binary_search(low :: pos_integer, high :: pos_integer, num :: pos_integer) ::
          pos_integer
  defp binary_search(low, high, num) do
    mid = low + div(high - low, 2)
    square = mid * mid

    case square do
      _ when num == square ->
        mid

      _ when square < num ->
        binary_search(mid + 1, high, num)

      _ ->
        binary_search(low, mid - 1, num)
    end
  end
end
