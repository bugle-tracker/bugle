defmodule Bugle.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION citext; ", "DROP EXTENSION citext")

    create table(:organizations) do
      add :name, :string
      add :slug, :citext

      timestamps()
    end

    create unique_index(:organizations, :slug)
  end
end
