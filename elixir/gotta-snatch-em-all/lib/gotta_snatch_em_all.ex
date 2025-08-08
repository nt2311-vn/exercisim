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
    case MapSet.member?(collection, their_card) do
      true -> {false, collection}
      false -> {true, collection |> MapSet.delete(your_card) |> MapSet.put(their_card)}
    end
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
    # Please implement extra_cards/2
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards(collections) do
    # Please implement boring_cards/1
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards(collections) do
    # Please implement total_cards/1
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    # Please implement split_shiny_cards/1
  end
end
