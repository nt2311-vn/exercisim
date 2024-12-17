defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([]), do: []
  def flatten([nil | t]), do: flatten(t)

  def flatten([a | t]) do
    cond do
      is_list(a) -> flatten(a) ++ flatten(t)
      true -> [a | flatten(t)]
    end
  end
end
