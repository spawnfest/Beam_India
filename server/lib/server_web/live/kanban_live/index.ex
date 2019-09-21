defmodule ServerWeb.KanbanLive.Index do
  use Phoenix.LiveView

  alias ServerWeb.KanbanView
  alias Server.Models.Card


  def mount(_assigns, socket) do
    columns = %{
      "One": Card.new(5),
      "two": Card.new(9),
      "three": Card.new(2),
    }

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
