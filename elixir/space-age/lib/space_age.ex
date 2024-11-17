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

  def age_on(:mercury, seconds), do: {:ok, seconds / 31_557_600 / 0.2408467}
  def age_on(:venus, seconds), do: {:ok, seconds / 31_557_600 / 0.61519726}
  def age_on(:earth, seconds), do: {:ok, seconds / 31_557_600}
  def age_on(:mars, seconds), do: {:ok, seconds / 31_557_600 / 1.8808158}
  def age_on(:jupiter, seconds), do: {:ok, seconds / 31_557_600 / 11.862615}
  def age_on(:saturn, seconds), do: {:ok, seconds / 31_557_600 / 29.447498}
  def age_on(:uranus, seconds), do: {:ok, seconds / 31_557_600 / 84.016846}
  def age_on(:neptune, seconds), do: {:ok, seconds / 31_557_600 / 164.79132}
  def age_on(planet, seconds), do: {:error, "not a planet"}

  # def age_on(planet, seconds) do
  #   case planet do
  #     :mercury -> {:ok, seconds / 31_557_600 / 0.2408467}
  #     :venus -> {:ok, seconds / 31_557_600 / 0.61519726}
  #     :earth -> {:ok, seconds / 31_557_600 / 1.0}
  #     :mars -> {:ok, seconds / 31_557_600 / 1.8808158}
  #     :jupiter -> {:ok, seconds / 31_557_600 / 11.862615}
  #     :saturn -> {:ok, seconds / 31_557_600 / 29.447498}
  #     :uranus -> {:ok, seconds / 31_557_600 / 84.016846}
  #     :neptune -> {:ok, seconds / 31_557_600 / 164.79132}
  #     _ -> {:error, "not a planet"}
  #   end
  # end
end
