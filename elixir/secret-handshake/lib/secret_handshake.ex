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
  def commands(0), do: []

  def commands(code) do
    binary_str = Integer.to_string(code, 2) |> String.reverse()

    result =
      []
      |> add_action(binary_str, 0, "wink")
      |> add_action(binary_str, 1, "double blink")
      |> add_action(binary_str, 2, "close your eyes")
      |> add_action(binary_str, 3, "jump")

    if String.length(binary_str) >= 5 and String.at(binary_str, 4) == "1" do
      result
    else
      Enum.reverse(result)
    end
  end

  defp add_action(result, binary_str, position, action) do
    if String.length(binary_str) > position and String.at(binary_str, position) == "1" do
      [action | result]
    else
      result
    end
  end
end
