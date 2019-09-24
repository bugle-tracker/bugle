import Config

config :bugle,
  ecto_repos: [Bugle.Repo]

config :bugle, BugleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TP+p/c7LIqdSzeCRbORpphyRf0RhKN/Ww9rs2Ld4e3QJJXPzDrxqumIUYDZyHJA5",
  render_errors: [view: BugleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bugle.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
