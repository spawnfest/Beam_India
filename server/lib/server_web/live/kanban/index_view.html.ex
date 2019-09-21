defmodule ServerWeb.Kanban do
  use Phoenix.LiveView

  def mount(_assigns, socket) do
    columns = ["One", "two", "three"]
    {:ok, assign(socket, :columns, columns )}
  end

  def render(assigns) do
    ~L"""
    KanBan board.

    <%= for col <- @columns do %>
    <p> <%= col %></p>
    <% end %>
    """
  end

end
