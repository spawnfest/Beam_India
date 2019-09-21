defmodule ServerWeb.KanbanLive.Index do
  use Phoenix.LiveView

  alias ServerWeb.KanbanView
  alias Server.Models.Board


  def mount(_assigns, socket) do
    board =  Board.new_random()

    {:ok, assign(socket, :board, board )}
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

    board = socket.assigns.board

    {drag_card, rest_of_board} =  pop_in(board.columns,[drag_column_id, drag_card_id])
    drop_card  =  get_in(board.columns,[drop_column_id, drop_card_id])
    # IO.puts inspect(socket.assigns.board)
    IO.puts "-------------------------"
    IO.puts inspect(drag_card)
    IO.puts inspect(drop_card)
    IO.puts "-------------------------"

    # require IEx; IEx.pry

    {:noreply, socket}
  end

  def move_card do
    #
  end

end
