defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    relation(a, b)
  end

  @spec relation(list, list) :: :unequal | :sublist | :superlist | :equal
  defp relation(a, b) do
    len_compare = length(a) - length(b)

    cond do
      len_compare == 0 ->
        if a === b, do: :equal, else: :unequal

      len_compare > 0 ->
        if is_sublist?(b, a), do: :superlist, else: :unequal

      len_compare < 0 ->
        if is_sublist?(a, b), do: :sublist, else: :unequal
    end
  end

  @spec is_sublist?(list, list) :: boolean
  defp is_sublist?([], _), do: true

  defp is_sublist?(shorter, longer) do
    Enum.any?(0..(length(longer) - length(shorter)), fn start ->
      Enum.slice(longer, start, length(shorter)) === shorter
    end)
  end
end
