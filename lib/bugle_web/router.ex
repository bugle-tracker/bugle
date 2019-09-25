defmodule BugleWeb.Router do
  use BugleWeb, :router

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

  scope "/", BugleWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/orgs/new", Organization.New
  end

  scope "/api", BugleWeb.API do
    pipe_through :api

    scope "/v1", V1 do
      get "/status/ping", StatusController, :ping
    end
  end
end
