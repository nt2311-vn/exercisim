defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  # def keep([], _fun), do: []
  #
  # def keep([head | tail], fun) do
  #   if fun.(head), do: [head | keep(tail, fun)], else: keep(tail, fun)
  # end
  def keep(list, fun) do
    for item <- list, fun.(item), do: item
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    for it <- list, !fun.(it), do: it
  end
end
