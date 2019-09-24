import Config

config :bugle, Bugle.Repo,
  username: "postgres",
  password: "postgres",
  database: "bugle_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :bugle, BugleWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
