defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    # "" |> add_pling(number) |> add_plang(number) |> add_plong(number) |> return_result(number)

    remain_three = rem(number, 3)
    remain_five = rem(number, 5)
    remain_seven = rem(number, 7)

    case {remain_three, remain_five, remain_seven} do
      {0, 0, 0} -> "PlingPlangPlong"
      {0, 0, _} -> "PlingPlang"
      {0, _, 0} -> "PlingPlong"
      {_, 0, 0} -> "PlangPlong"
      {0, _, _} -> "Pling"
      {_, 0, _} -> "Plang"
      {_, _, 0} -> "Plong"
      _ -> Integer.to_string(number)
    end
  end

  # defp add_pling(x, num), do: if(rem(num, 3) == 0, do: "#{x}Pling", else: x)
  # defp add_plang(x, num), do: if(rem(num, 5) == 0, do: "#{x}Plang", else: x)
  # defp add_plong(x, num), do: if(rem(num, 7) == 0, do: "#{x}Plong", else: x)
  #
  # defp return_result(x, num) do
  #   if String.length(x) == 0, do: Integer.to_string(num), else: x
  # end
end
