defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    str_len = Enum.count(digits)

    number ==
      digits
      |> Enum.reduce(0, fn digit, total -> total + Integer.pow(digit, str_len) end)
  end
end
