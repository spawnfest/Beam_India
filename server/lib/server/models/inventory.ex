defmodule Server.Models.Inventory do

  defstruct [
    id: 0,
    card_id: 123,
    quantity: 0
  ]

  @doc
  """
  Quantity of product(s)
  """
  def new(card_id, quantity) do
    %__MODULE__{
      card_id: card_id,
      quantity: quantity
    }
  end

  def decrement(%__MODULE__{quantity: quantity} = inventory, decrement_by \\ 1) do
    %__MODULE__{inventory | quantity: (quantity - decrement_by)}
  end

end
