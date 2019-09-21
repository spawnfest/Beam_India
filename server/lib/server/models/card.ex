defmodule Server.Models.Card do
  import Faker

  defstruct [id: 0000,
             data: "",
             title: "",
             index: 0
            ]

  def new(%{index: index}) do
    %__MODULE__{
      id: Faker.UUID.v4,
      data: Faker.Lorem.paragraph,
      title: Faker.Lorem.sentence,
      index: index,
    }
  end

  def new(0, _) do
    []
  end

  def new(count, index \\ 1) do
    [new(%{index: index}) | new(count - 1, index + 1)]
  end
end
