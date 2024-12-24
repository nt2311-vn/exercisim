defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey("УХОДИ"), do: "Whoa, chill out!"

  def hey(input) do
    cond do
      yell_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yell?(input) -> "Whoa, chill out!"
      silence?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  @spec yell_question?(String.t()) :: boolean
  defp yell_question?(s) do
    s |> yell?() and s |> question?()
  end

  @spec yell?(String.t()) :: boolean
  defp yell?(s) do
    trimmed = String.trim(s)

    trimmed == String.upcase(trimmed) and String.match?(trimmed, ~r/[A-Z]/)
  end

  @spec question?(String.t()) :: boolean
  defp question?(s) do
    s |> String.trim() |> String.ends_with?("?")
  end

  @spec silence?(String.t()) :: boolean
  defp silence?(s) do
    s |> String.trim() == ""
  end
end
