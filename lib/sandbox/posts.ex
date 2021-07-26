defmodule Sandbox.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Sandbox.Repo

  alias Sandbox.Posts
  alias Sandbox.Posts.Post
  alias Sandbox.Comments
  alias Sandbox.Logs
  alias Sandbox.Logs.LogPostComment

  require Logger

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Post
    |> Repo.all()
    |> Repo.preload(:log_post_comment)
  end

  @doc """
  Returns the number of comments in a post.

  ## Examples

      TODO: add example in comment.

  """
  def get_number_of_comments(post_id) do
    post = Posts.get_post!(post_id) |> Repo.preload([:comments])
    Enum.count(post.comments)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id) do
    Post
    |> Repo.get!(id)
    |> Repo.preload(:log_post_comment)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:log_post_comment, with: &LogPostComment.changeset/2)
    |> Repo.insert()
  end

  @doc """
  Adds a comment to a post.

  ## Examples

      TODO: Comment example.

  """
  def add_comment(post_id, comment_params) do
    # Check if a log exists for this post. If not, create one.
    try do
      Repo.get_by!(LogPostComment, post_id: post_id)
    rescue
      Ecto.NoResultsError -> Logs.create_log_post_comment(%{numOfComments: 0, post_id: post_id})
    end

    # Update counter
    from(log in Sandbox.Logs.LogPostComment,
      update: [inc: [numOfComments: 1]],
      where: log.post_id == ^post_id
    )
    |> Repo.update_all([])

    comment_params
    |> Map.put("post_id", post_id)
    |> Comments.create_comment()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:log_post_comment, with: &LogPostComment.changeset/2)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
