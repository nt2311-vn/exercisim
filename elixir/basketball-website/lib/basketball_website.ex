defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path
    |> String.split(".")
    |> Enum.reduce(data, fn k, acc ->
      if is_map(acc) and Map.has_key?(acc, k), do: acc[k], else: nil
    end)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end

  # defp do_extract(data, []), do: data
  #
  # defp do_extract(data, [head | tail]) do
  #   do_extract(data[head], tail)
  # end
end
