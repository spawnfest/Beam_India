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

  def handle_event("create_new_card", form_inputs, socket) do
    %{"card-title" => card_title,
      "column_id" => column_id
    } = form_inputs

    columns = socket.assigns.columns

    new_card = Server.Models.Card.new(card_title)
    {new_card_id, new_card_content} =  Map.pop(new_card, :id)

    old_col = get_in(columns, [column_id])
    col_aftr_add =  %Server.Models.Column{old_col | cards: Map.put(old_col.cards, new_card_id, new_card_content) }
    updated_board = put_in(columns, [column_id], col_aftr_add)

    {:noreply, assign(socket, columns: updated_board)}
  end

  def handle_event("update_card", form_inputs, socket) do
    %{"card-title" => card_title,
      "column_id" => column_id,
      "card_id" => card_id
    } = form_inputs

    columns = socket.assigns.columns

    # card = find_card

    # new_card = Server.Models.Card.new(card_title)
    # {new_card_id, new_card_content} =  Map.pop(new_card, :id)
    # old_col = get_in(columns, [column_id])
    # col_aftr_add =  %Server.Models.Column{old_col | cards: Map.put(old_col.cards, new_card_id, new_card_content) }
    # updated_board = put_in(columns, [column_id], col_aftr_add)

    {:noreply, assign(socket, columns: columns)}
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
