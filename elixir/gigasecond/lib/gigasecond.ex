defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {:ok, naive_datetime} =
      NaiveDateTime.new(year, month, day, hours, minutes, seconds)

    giga_after = NaiveDateTime.add(naive_datetime, 1_000_000_000)

    {{giga_after.year, giga_after.month, giga_after.day},
     {giga_after.hour, giga_after.minute, giga_after.second}}
  end
end
