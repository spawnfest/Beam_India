defmodule ServerWeb.KanbanLive.Index do
  use Phoenix.LiveView

  alias ServerWeb.KanbanView
  alias Server.Models.Card


  def mount(_assigns, socket) do
    columns = %{
      "One": ~w(abc Bde C D E F H),
      "two": ~w(orange mango banana),
      "three": ~w(idli dosa uttappa upma),
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
