defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance([], []), do: {:ok, 0}
  def hamming_distance(base, base), do: {:ok, 0}

  def hamming_distance(base, compare) when length(base) != length(compare),
    do: {:error, "strands must be of equal length"}

  def hamming_distance(base, compare) do
    distance =
      base
      |> Enum.with_index()
      |> Enum.reduce(0, fn {base_strand, idx}, acc ->
        if base_strand == Enum.at(compare, idx) do
          acc
        else
          acc + 1
        end
      end)

    {:ok, distance}
  end
end
