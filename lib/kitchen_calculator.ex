defmodule KitchenCalculator do
  def get_volume({_unit, volume}) do
    volume
  end

  def to_milliliter({:milliliter, _volume} = volume_pair), do: volume_pair
  def to_milliliter({:cup, volume}), do: {:milliliter, 240 * volume}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, 30 * volume}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, 5 * volume}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, 15 * volume}

  def from_milliliter(volume_pair, :milliliter), do: {:milliliter, get_volume(volume_pair)}
  def from_milliliter(volume_pair, :cup), do: {:cup, get_volume(volume_pair) / 240}
  def from_milliliter(volume_pair, :fluid_ounce), do: {:fluid_ounce, get_volume(volume_pair) / 30}
  def from_milliliter(volume_pair, :teaspoon), do: {:teaspoon, get_volume(volume_pair) / 5}
  def from_milliliter(volume_pair, :tablespoon), do: {:tablespoon, get_volume(volume_pair) / 15}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
