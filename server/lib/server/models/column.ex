defmodule Server.Models.Column do
  alias Server.Models.Card

  defstruct [
    id: 0,
    title: "",
    cards: [],
    index: 0
  ]


  #########

  @behaviour Access

  @impl Access
  def fetch(column, card_id) do
    Map.fetch(column.cards, card_id)
  end

  @impl Access
  def get_and_update(column, card_id, fun) do
    {card, other_cards} = Map.pop(column.cards, card_id)
    {_something, other_map} = fun.(card_id)
    # require IEx; IEx.pry
    {column, %__MODULE__{column | cards: Map.merge(column.cards, other_map) } }
  end

  @impl Access
  def pop(column, card_id) do
    {card, other_cards} = Map.pop(column.cards, card_id)

    {card, %__MODULE__{column | cards: other_cards } }
  end

  @doc """
  For now We have added test data as we build the cards, column functionality of drag and drop.
  """
  def new_random do
    random_count = Enum.random([1,2,4,5,7,9,3,12])
    cards = Card.few_random(random_count)

    %__MODULE__{
      id: generate_uniq_id,
      title: some_name(),
      cards: split_cards(cards),
      index: :random.uniform(100)
    }
  end

  defp some_name do
    ~w(Mango Banana Jackfruit Apple Orange Watermelon)
    |> Enum.random
  end

  defp generate_uniq_id do
    Integer.to_string(:rand.uniform(4294967296), 32) <> Integer.to_string(:rand.uniform(4294967296), 32)
  end

  # I want a nested Board.
  # A map with column_id as key and values will contain column_title, cards.
  # Similarly, Card will be a Map with card_id as key and value includes title, description of card.
  # Enum Map gave a list, need an array so used Reduce
  defp split_cards(columns) do
    # Enum.reduce([1, 2, 3], %{}, fn x, acc -> Map.put(acc, x, x)  end) end)

    Enum.reduce(columns, %{}, fn(column, acc) ->
      {id, remaining_column} = Map.pop(column, :id);
      # %{id => remaining_column}
      Map.put(acc, id, remaining_column)
    end)

  end

end
