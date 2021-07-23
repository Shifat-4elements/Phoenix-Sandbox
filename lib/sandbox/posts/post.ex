defmodule Sandbox.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sandbox.Comments.Comment

  schema "posts" do
    field :body, :string
    field :title, :string
    has_many :comments, Comment
    has_one :log_post_comment, Sandbox.Logs.LogPostComment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
