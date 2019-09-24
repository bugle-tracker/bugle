defmodule Bugle.Repo do
  use Ecto.Repo,
    otp_app: :bugle,
    adapter: Ecto.Adapters.Postgres
end
