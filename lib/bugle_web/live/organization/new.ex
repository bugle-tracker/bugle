defmodule BugleWeb.Organization.New do
  use Phoenix.LiveView
  alias Bugle.CRM
  use Phoenix.HTML
  import BugleWeb.ErrorHelpers

   def mount(_session, socket) do
    changeset = CRM.change_organization(%CRM.Organization{})
    {:ok, assign(socket, changeset: changeset)}
  end

  def render(assigns) do
    ~L"""
    <h2>Create Your Organization</h2>

    <%= form_for @changeset, "#", [phx_change: :validate, phx_submit: :save, phx_hook: "SavedForm"], fn f -> %>
      <%= label f, :name %>
      <%= text_input f, :name, phx_debounce: "blur" %>
      <%= error_tag f, :name %>

      <%= label f, :slug %>
      <%= text_input f, :slug %>
      <%= error_tag f, :slug %>
      <div>
        <%= submit "Save", phx_disable_with: "Saving..." %>
      </div>
    <% end %>
    """
  end

  def handle_event("validate", %{"organization" => org_params}, socket) do
    changeset =
      CRM.change_organization(%CRM.Organization{}, org_params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"organization" => org_params}, socket) do
    case CRM.create_organization(org_params) do
      {:ok, _org} ->
        {:stop,
         socket
         |> put_flash(:info, "org created")
         |> redirect(to: "/")
        }

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
