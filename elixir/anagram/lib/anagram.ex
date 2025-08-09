defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn candidate ->
      is_anagram?(String.downcase(candidate), String.downcase(base))
    end)
  end

  defp is_anagram?(base, base), do: false

  defp is_anagram?(base, candidate) do
    sort_letters(base) == sort_letters(candidate)
  end

  defp sort_letters(string) do
    string
    |> String.split("")
    |> Enum.sort()
    |> Enum.join()
  end
end
