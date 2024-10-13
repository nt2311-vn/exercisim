defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, vol}), do: {:milliliter, vol * 240}
  def to_milliliter({:fluid_ounce, vol}), do: {:milliliter, vol * 30}
  def to_milliliter({:teaspoon, vol}), do: {:milliliter, vol * 5}
  def to_milliliter({:tablespoon, vol}), do: {:milliliter, vol * 15}
  def to_milliliter({:milliliter, vol}), do: {:milliliter, vol}

  def from_milliliter({_, vol}, :cup), do: {:cup, vol / 240}
  def from_milliliter({_, vol}, :fluid_ounce), do: {:fluid_ounce, vol / 30}
  def from_milliliter({_, vol}, :tablespoon), do: {:tablespoon, vol / 15}
  def from_milliliter({_, vol}, :teaspoon), do: {:teaspoon, vol / 5}
  def from_milliliter({_, vol}, :milliliter), do: {:milliliter, vol}

  def convert(volume_pair, unit) do
    {_, mil_vol} = to_milliliter(volume_pair)
    {unit, convert_vol} = from_milliliter({:milliliter, mil_vol}, unit)
    {unit, convert_vol}
  end
end
