defmodule BoutiqueInventory do
  def sort_by_price([]), do: []

  def sort_by_price(inventory) do
    inventory |> Enum.sort(fn %{price: x}, %{price: y} -> x <= y end)
  end

  def with_missing_price([]), do: []

  def with_missing_price(inventory) do
    inventory |> Enum.filter(fn %{price: x} -> x == nil end)
  end

  def update_names([], _, _), do: []

  def update_names(inventory, old_word, new_word) do
  end

  def increase_quantity(item, count) do
    updated_quantity =
      case map_size(item[:quantity_by_size]) do
        0 -> %{}
        _ -> Enum.into(item[:quantity_by_size], %{}, fn {k, v} -> {k, v + count} end)
      end

    %{item | quantity_by_size: updated_quantity}
  end

  def total_quantity(item) do
    case map_size(item[:quantity_by_size]) do
      0 -> 0
      _ -> Map.to_list(item[:quantity_by_size]) |> Enum.reduce(0, fn {_, v}, acc -> acc + v end)
    end
  end
end
