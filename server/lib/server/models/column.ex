defmodule Server.Models.Column do
  defstruct [id: 0000, card: [%Server.Models.Card{}], index: :random.uniform(100)]
end