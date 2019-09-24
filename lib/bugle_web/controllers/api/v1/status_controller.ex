defmodule BugleWeb.API.V1.StatusController do
  use BugleWeb, :controller

  def ping(conn, _) do
    text(conn, "pong")
  end
end
