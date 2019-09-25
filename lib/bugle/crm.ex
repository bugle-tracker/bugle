defmodule Bugle.CRM do
  alias Bugle.Repo
  alias Bugle.CRM.Organization

  def create_organization(attrs \\ %{}) do
    %Organization{}
    |> change_organization(attrs)
    |> Repo.insert()
  end

  def change_organization(org, attrs \\ %{}) do
    Organization.changeset(org, attrs)
  end
end
