defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    1..8 |> Enum.to_list()
  end

  def files do
    ?A..?H |> Enum.map(&<<&1>>)
  end
end
