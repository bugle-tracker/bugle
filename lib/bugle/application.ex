defmodule Bugle.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Bugle.Repo,
      BugleWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Bugle.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    BugleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
