defmodule Server.Models.Card do
  import Faker

  defstruct [id: 0000,
             data: "",
             title: "",
             index: 0
            ]


  def new(title, data, index) do
    %__MODULE__{
      id: Faker.UUID.v4,
      title: title,
      data: data,
      index: index
    }
  end


  def few_random(%{index: index}) do
    fake_data = Faker.Lorem.paragraph
    fake_title = Faker.Lorem.sentence
    __MODULE__.new(fake_title, fake_data, index)
  end

  def few_random(0, _) do
    []
  end

  def few_random(count, index \\ 1) do
    [few_random(%{index: index}) | few_random(count - 1, index + 1)]
  end
end
