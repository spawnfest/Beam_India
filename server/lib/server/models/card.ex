defmodule Server.Models.Card do
  defstruct [id: 0000,
             data: "",
             title: "",
             index: 0
            ]


  def new(title, data \\ "abc", index \\ 1) do
    %__MODULE__{
      id: generate_uniq_id,
      title: title,
      data: data,
      index: index
    }
  end


  def few_random(%{index: index}) do
    fake_data = some_name(:two)
    fake_title = some_name(:one)
    __MODULE__.new(fake_title, fake_data, index)
  end

  def few_random(0, _) do
    []
  end

  def few_random(count, index \\ 1) do
    [few_random(%{index: index}) | few_random(count - 1, index + 1)]
  end

  defp generate_uniq_id do
    Integer.to_string(:rand.uniform(4294967296), 32) <> Integer.to_string(:rand.uniform(4294967296), 32)
  end

  defp some_name(type \\ :one) do
    wo = ~w(headphone mic helmet monitor chair door knob towel pillow wire router) |> Enum.random

    case type do
      :one -> "#{wo} #{:random.uniform(99)}"
      :two -> "#{wo} #{wo} #{wo} #{:random.uniform(99)}"
    end
  end

end
