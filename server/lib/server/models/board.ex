defmodule Server.Models.Board do
  alias Server.Models.Column

  defstruct [
    id: 0,
    column_count: 0,
    columns: %{}
  ]

  def new_random do

    cols = [
      Column.new_random(),
      Column.new_random(),
      Column.new_random()
    ]

    %__MODULE__{
      id: 1,
      # column_count: :rand.uniform(5),
      columns: split_columns(cols)
    }
  end

  def split_columns(columns) do
    # Enum.reduce([1, 2, 3], %{}, fn x, acc -> Map.put(acc, x, x)  end) end)

    Enum.reduce(columns, %{}, fn(column, acc) ->
      {id, remaining_column} = Map.pop(column, :id);
      # %{id => remaining_column}
      Map.put(acc, id, remaining_column)
    end)

  end

  #########

  @behaviour Access

  @impl Access
  def fetch(board, column_id) do
    Map.fetch(board.columns, column_id)
  end

  # @impl Access
  # def get(board, column_id, fun) do
  #   # Map.get_and_update(board.columns, column_id, fun)
  #   Map.get(board, column_id)
  # end

  @impl Access
  def get_and_update(board, column_id, fun) do
    Map.get_and_update(board.columns, column_id, fun)
  end

  @impl Access
  def pop(board, column_id) do
    Map.pop(board.columns, column_id)
  end

end
