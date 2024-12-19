defmodule LibraryFees do
  def datetime_from_string(string) do
    case NaiveDateTime.from_iso8601(string) do
      {:ok, naive_time} -> naive_time
      _ -> nil
    end
  end

  def before_noon?(datetime) do
    case Time.compare(datetime, ~T[12:00:00]) do
      :lt -> true
      _ -> false
    end
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime),
      do: Date.add(checkout_datetime, 28),
      else: Date.add(checkout_datetime, 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(planned_return_date, actual_return_datetime)

    cond do
      diff >= 0 -> 0
      true -> -diff
    end
  end

  def monday?(datetime) do
    case Date.day_of_week(datetime) do
      1 -> true
      _ -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return = return_date(datetime_from_string(checkout))
    actual_return = datetime_from_string(return)
    late = days_late(planned_return, actual_return)

    if monday?(actual_return),
      do: (0.5 * late * rate) |> Float.floor(),
      else: late * rate
  end
end
