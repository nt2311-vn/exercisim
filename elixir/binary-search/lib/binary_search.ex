defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  # def search({}, _key), do: :not_found
  # def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers) - 1)
  #
  # def search(numbers, key, 0, 1) when elem(numbers, 0) == key, do: {:ok, 0}
  #
  # def search(numbers, key, min, max) when div(max - min, 2) == 0 and elem(numbers, max) == key,
  #   do: {:ok, max}
  #
  # def search(numbers, key, min, max) do
  #   middle = div(max - min, 2) + min
  #   value = elem(numbers, middle)
  #
  #   cond do
  #     value == key -> {:ok, middle}
  #     middle == max or middle == min -> :not_found
  #     value < key -> search(numbers, key, middle, max)
  #     value > key -> search(numbers, key, min, middle)
  #   end
  # end

  def search({}, _key), do: :not_found

  def search(numbers, key) do
    do_search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp do_search(_numbers, _key, left, right) when left > right, do: :not_found

  defp do_search(numbers, key, left, right) do
    middle = div(left + right, 2)

    case elem(numbers, middle) do
      ^key -> {:ok, middle}
      element when key > element -> do_search(numbers, key, middle + 1, right)
      element when key < element -> do_search(numbers, key, left, middle - 1)
    end
  end
end
