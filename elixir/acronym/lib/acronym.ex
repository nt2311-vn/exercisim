defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split("-")
    |> Enum.join(" ")
    |> String.split(" ")
    |> Enum.map(fn word ->
      String.replace(word, "_", "")
    end)
    |> Enum.reject(fn word -> word == "" end)
    |> Enum.map(fn word -> String.first(word) |> String.upcase() end)
    |> Enum.join("")
  end
end
