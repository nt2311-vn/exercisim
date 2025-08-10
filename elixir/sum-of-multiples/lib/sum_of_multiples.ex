defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    new_list = []

    factors
    |> Enum.reduce(new_list, fn factor, list ->
      cond do
        factor >= limit or factor == 0 ->
          list

        true ->
          list ++ for n <- factor..(limit - 1), rem(n, factor) == 0, do: n
      end
    end)
    |> Enum.uniq()
    |> Enum.sum()
  end
end
