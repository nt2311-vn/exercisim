defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())

  def commands(code) do
    code
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce([], fn {bit, index}, acc ->
      if bit == 1 do
        add_action(index, acc)
      else
        acc
      end
    end)
    |> Enum.reverse()
  end

  defp add_action(0, acc), do: ["wink" | acc]
  defp add_action(1, acc), do: ["double blink" | acc]
  defp add_action(2, acc), do: ["close your eyes" | acc]
  defp add_action(3, acc), do: ["jump" | acc]
  defp add_action(4, acc), do: Enum.reverse(acc)
  defp add_action(_, acc), do: acc
end
