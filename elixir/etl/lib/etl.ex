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
    |> Enum.flat_map(fn {point, score_list} ->
      Enum.map(score_list, fn score_char ->
        {String.downcase(score_char), point}
      end)
    end)
    |> Map.new()
  end
end
