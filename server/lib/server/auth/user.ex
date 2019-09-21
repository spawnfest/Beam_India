defmodule Server.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :is_active, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :is_active])
    |> validate_required([:email, :is_active])
    |> unique_constraint(:email)
  end
end
