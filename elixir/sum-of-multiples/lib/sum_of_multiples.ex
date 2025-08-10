defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.reduce(MapSet.new(), fn factor, set ->
      cond do
        factor >= limit or factor == 0 ->
          set

        true ->
          factor..(limit - 1)
          |> Stream.filter(&(rem(&1, factor) == 0))
          |> Enum.into(set)
      end
    end)
    |> Enum.sum()
  end
end
