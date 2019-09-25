import Config

config :bugle, Bugle.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  url: System.get_env("DATABASE_URL") || "ecto://postgres:postgres@localhost/bugle_test"

config :bugle, BugleWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
