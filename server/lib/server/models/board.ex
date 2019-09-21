defmodule Server.Models.Board do
  alias Server.Models.Column

  defstruct [
    id: 0,
    column_count: 0,
    columns: []
  ]

  def new_random do
    %__MODULE__{
      id: 1,
      column_count: :rand.uniform(5),
      columns: [
        Column.new_random(),
        Column.new_random(),
        Column.new_random()
      ]
    }
  end

end
