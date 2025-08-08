defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    MapSet.new([card])
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    case MapSet.member?(collection, card) do
      true -> {true, collection}
      false -> {false, MapSet.put(collection, card)}
    end
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    {MapSet.member?(collection, your_card) and not MapSet.member?(collection, their_card),
     MapSet.delete(collection, your_card) |> MapSet.put(their_card)}
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    cards
    |> Enum.sort()
    |> Enum.reduce([], fn card, uniqe_list ->
      case Enum.member?(uniqe_list, card) do
        true -> uniqe_list
        false -> [card | uniqe_list]
      end
    end)
    |> Enum.reverse()
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    MapSet.difference(your_collection, their_collection)
    |> MapSet.size()
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards([]), do: []

  def boring_cards(collections) do
    [head | tail] = collections

    tail
    |> Enum.reduce(head, &MapSet.intersection/2)
    |> MapSet.to_list()
    |> Enum.sort()
  end

  @spec total_cards([collection()]) :: non_neg_integer()

  def total_cards(collections) do
    collections
    |> Enum.reduce(MapSet.new(), &MapSet.union/2)
    |> Enum.count()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    {collection
     |> MapSet.filter(fn card -> String.starts_with?(card, "Shiny") end)
     |> Enum.sort(),
     collection
     |> MapSet.reject(fn card -> String.starts_with?(card, "Shiny") end)
     |> Enum.sort()}
  end
end
