defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    input
    |> Enum.reduce(%{}, fn {point, score_list}, acc ->
      score_list
      |> Enum.reduce(acc, fn score_char, acc_inner ->
        Map.put(acc_inner, String.downcase(score_char), point)
      end)
    end)
  end
end
