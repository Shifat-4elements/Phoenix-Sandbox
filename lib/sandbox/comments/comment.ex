defmodule Sandbox.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sandbox.Posts.Post

  schema "comments" do
    field :content, :string
    field :name, :string
    # field :post_id, :id
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :content, :post_id])
    |> validate_required([:name, :content, :post_id])
  end
end
