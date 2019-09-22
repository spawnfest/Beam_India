defmodule Server.Models.Column do
  import Faker

  alias Server.Models.Card

  # @derive [Board]
  # @derive [Access]
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
    # Map.fetch(column.cards, card_id)

    # require IEx; IEx.pry

    Map.fetch(column.cards, card_id)
  end

  @impl Access
  def get_and_update(column, card_id, fun) do
    # require IEx; IEx.pry

    # {card, other_cards} = Map.pop(column.cards, card_id)

    {card, _other_cards} = Map.pop(column.cards, card_id)
    {_something, dragged_card} = fun.(card_id)

    # IO.puts  "-=-=-=-=-=-"
    # IO.puts inspect(dragged_card)

    # IO.puts  "-=-=-=-=-=-"
    # IO.puts inspect(column.cards)
    # IO.puts "add card"

    # require IEx; IEx.pry

    # IO.puts inspect(fun.(card_id))

    {column, %__MODULE__{column | cards: Map.put(column.cards, card_id, dragged_card) } }
    # Map.get_and_update(column.cards, card_id, fun)
  end

  @impl Access
  def pop(column, card_id) do

    # require IEx; IEx.pry
    # require IEx; IEx.pry
    {card, other_cards} = Map.pop(column.cards, card_id)

    {card, %__MODULE__{column | cards: other_cards } }
    # Map.pop(split_cards(column.cards), card_id)
  end



  # @behaviour Access
  # def fetch(term, key) do
  #   {:ok, %{} }
  # end

  # def get(structure, key, default) do
  #   case fetch(structure, key) do
  #     {:ok, value} -> value
  #     :error       -> default
  #   end
  # end

  def new_random do
    random_count = Enum.random([1,2,4,5,7,9,3,12])
    cards = Card.few_random(random_count)


    %__MODULE__{
      id: Faker.UUID.v4,
      title: "doooo",
      # cards: Enum.map(cards,&(%{&1.id => &1  })),
      cards: split_cards(cards),
      index: :random.uniform(100)
    }
  end

  def split_cards(columns) do
    # Enum.reduce([1, 2, 3], %{}, fn x, acc -> Map.put(acc, x, x)  end) end)

    Enum.reduce(columns, %{}, fn(column, acc) ->
      {id, remaining_column} = Map.pop(column, :id);
      # %{id => remaining_column}
      Map.put(acc, id, remaining_column)
    end)

    # Enum.map(cards, fn(card) ->
    #   {id, remaing_card} = Map.pop(card, :id);
    #   %{id => remaing_card}
    # end)


  end

end
