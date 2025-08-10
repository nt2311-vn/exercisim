defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    num_str = Integer.to_string(number)
    str_len = String.length(num_str)

    number ==
      num_str
      |> String.graphemes()
      |> Enum.reduce(0, fn number, total ->
        total + Integer.pow(String.to_integer(number), str_len)
      end)
  end
end
