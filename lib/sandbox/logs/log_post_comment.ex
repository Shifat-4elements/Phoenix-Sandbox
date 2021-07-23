defmodule Sandbox.Logs.LogPostComment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sandbox.Posts.Post

  schema "log_post_comment" do
    field :numOfComments, :integer
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(log_post_comment, attrs) do
    log_post_comment
    |> cast(attrs, [:numOfComments])
    |> validate_required([:numOfComments])
  end
end
