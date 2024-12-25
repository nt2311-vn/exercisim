defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number < 1,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(1), do: {:ok, :deficient}
  def classify(2), do: {:ok, :deficient}
  def classify(number), do: sum_factors(number)

  @spec sum_factors(n :: integer) :: {:ok, atom}
  defp sum_factors(n) do
    half = div(n, 2)
    sum = 2..half |> Enum.reduce(1, fn x, acc -> if rem(n, x) == 0, do: acc + x, else: acc end)

    cond do
      sum == n -> {:ok, :perfect}
      true -> if sum > n, do: {:ok, :abundant}, else: {:ok, :deficient}
    end
  end
end
