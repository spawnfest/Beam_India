defmodule Server.Models.Column do
  import Faker

  alias Server.Models.Card

  defstruct [
    id: 0,
    title: "",
    cards: [],
    index: 0
  ]

  def new_random do
    random_count = Enum.random([1,2,4,5,7,9,3,12])

    %__MODULE__{
      id: Faker.UUID.v4,
      title: "doooo",
      cards: Card.few_random(random_count),
      index: :random.uniform(100)
    }
  end

end
