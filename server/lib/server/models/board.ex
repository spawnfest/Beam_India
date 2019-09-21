defmodule Server.Models.Board do
  defstruct [id: 0000, column_count: :rand.uniform(5), columns: [%Server.Models.Column{}]]
end