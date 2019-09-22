defmodule ServerWeb.KanbanLive.Index do
  use Phoenix.LiveView

  alias ServerWeb.KanbanView
  alias Server.Models.Board


  def mount(_assigns, socket) do
    board =  Board.new_random()

    # # {:ok, assign(socket, :board, board )}
    {:ok, assign(socket, :columns, board.columns )}
  end

  def render(assigns) do
    KanbanView.render("index.html", assigns)
  end

  def handle_event("move-card", %{"drag_column_id" => drag_column_id,
                                  "drag_card_id" => drag_card_id,
                                  "drop_card_id" => drop_card_id,
                                  "drop_column_id" => drop_column_id
                                 } = card_ids,
    socket) do

    # board = socket.assigns.board
    columns = socket.assigns.columns

    {drag_card, rest_of_board} =  pop_in(columns,[drag_column_id, drag_card_id])
    drop_card  =  get_in(columns,[drop_column_id, drop_card_id])

    # require IEx; IEx.pry
    updated_board = put_in(rest_of_board, [drop_column_id, drop_card_id], %{drag_card_id => drag_card, drop_card_id => drop_card})


    {:noreply, assign(socket, columns: updated_board)}
  end

  def move_card do
    #
  end

end
