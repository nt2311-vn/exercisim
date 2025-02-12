defmodule RemoteControlCar do
  # Please implement the struct with the specified fields
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    remoteCar = %RemoteControlCar{nickname: "none"}
    %{remoteCar | nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: traveled_meters}),
    do: "#{traveled_meters} meters"

  def display_battery(%RemoteControlCar{battery_percentage: 0}),
    do: "Battery empty"

  def display_battery(%RemoteControlCar{battery_percentage: percent}),
    do: "Battery at #{percent}%"

  def drive(%RemoteControlCar{
        nickname: name,
        battery_percentage: percent,
        distance_driven_in_meters: traveled_meters
      }) do
    case percent do
      0 ->
        %RemoteControlCar{
          nickname: name,
          battery_percentage: percent,
          distance_driven_in_meters: traveled_meters
        }

      _ ->
        %RemoteControlCar{
          nickname: name,
          battery_percentage: percent - 1,
          distance_driven_in_meters: traveled_meters + 20
        }
    end
  end
end
