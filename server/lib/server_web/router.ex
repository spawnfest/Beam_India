defmodule ServerWeb.Router do
  use ServerWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ServerWeb do
    pipe_through :browser

    # get "/", PageController, :index

    live "/", Kanban
  end

  # Other scopes may use custom stacks.
  # scope "/api", ServerWeb do
  #   pipe_through :api
  # end
end
