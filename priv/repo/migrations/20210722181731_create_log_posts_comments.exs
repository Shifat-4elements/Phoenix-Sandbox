defmodule Sandbox.Repo.Migrations.CreateLogPostsComments do
  use Ecto.Migration

  def change do
    create table(:log_posts_comments) do
      add :numOfComments, :integer
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end
  end
end

# create table("products") do
#   add :group_id, references("groups")
# end

# create table("categories") do
#   add :group_id, :integer
#   # A composite foreign that points from categories (product_id, group_id)
#   # to products (id, group_id)
#   add :product_id, references("products", with: [group_id: :group_id])
# end
