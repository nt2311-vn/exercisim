defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    rad = :math.sqrt(x * x + y * y)

    cond do
      rad <= 1 -> 10
      rad <= 5 -> 5
      rad <= 10 -> 1
      true -> 0
    end
  end
end
