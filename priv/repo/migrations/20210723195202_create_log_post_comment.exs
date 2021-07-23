defmodule Sandbox.Repo.Migrations.CreateLogPostComment do
  use Ecto.Migration

  def change do
    create table(:log_post_comment) do
      add :numOfComments, :integer
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

  end
end
