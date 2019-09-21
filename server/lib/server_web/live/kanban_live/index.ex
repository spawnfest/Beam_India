defmodule ServerWeb.KanbanLive.Index do
  use Phoenix.LiveView

  alias ServerWeb.KanbanView


  def mount(_assigns, socket) do
    columns = ["One", "two", "three"]
    {:ok, assign(socket, :columns, columns )}
  end

  def render(assigns) do
    KanbanView.render("index.html", assigns)
  end

end
