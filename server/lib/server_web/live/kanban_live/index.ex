defmodule ServerWeb.KanbanLive.Index do
  use Phoenix.LiveView

  alias ServerWeb.KanbanView
  alias Server.Models.Board


  def mount(_assigns, socket) do
    %Board{columns: columns} = Board.new_random

    {:ok, assign(socket, :columns, columns )}
  end

  def render(assigns) do
    KanbanView.render("index.html", assigns)
  end

  def handle_event("move-card", card_id, socket) do

    IO.puts "-------------------------"
    IO.puts inspect(card_id)
    IO.puts "-------------------------"

    {:noreply, socket}
  end

end
