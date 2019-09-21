defmodule ServerWeb.KanbanLive.Index do
  use Phoenix.LiveView

  alias ServerWeb.KanbanView


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

end
