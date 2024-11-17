defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    case planet do
      :mercury -> {:ok, seconds / 31_557_600 / 0.2408467}
      :venus -> {:ok, seconds / 31_557_600 / 0.61519726}
      :earth -> {:ok, seconds / 31_557_600 / 1.0}
      :mars -> {:ok, seconds / 31_557_600 / 1.8808158}
      :jupiter -> {:ok, seconds / 31_557_600 / 11.862615}
      :saturn -> {:ok, seconds / 31_557_600 / 29.447498}
      :uranus -> {:ok, seconds / 31_557_600 / 84.016846}
      :neptune -> {:ok, seconds / 31_557_600 / 164.79132}
      _ -> {:error, "not a planet"}
    end
  end
end
