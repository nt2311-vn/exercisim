defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, opts \\ []) do
    maximum_price = Keyword.get(opts, :maximum_price, 100)

    tops
    |> Enum.flat_map(&Enum.map(bottoms, fn bottom -> {&1, bottom} end))
    |> Enum.reject(fn {top, bottom} -> top.base_color == bottom.base_color end)
    |> Enum.filter(fn {top, bottom} -> top.price + bottom.price <= maximum_price end)
  end
end
