defmodule Sandbox.Logs do
  @moduledoc """
  The Logs context.
  """

  import Ecto.Query, warn: false
  alias Sandbox.Repo

  alias Sandbox.Logs.LogPostComment

  @doc """
  Returns the list of log_post_comment.

  ## Examples

      iex> list_log_post_comment()
      [%LogPostComment{}, ...]

  """
  def list_log_post_comment do
    Repo.all(LogPostComment)
  end

  @doc """
  Gets a single log_post_comment.

  Raises `Ecto.NoResultsError` if the Log post comment does not exist.

  ## Examples

      iex> get_log_post_comment!(123)
      %LogPostComment{}

      iex> get_log_post_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_log_post_comment!(id), do: Repo.get!(LogPostComment, id)

  @doc """
  Creates a log_post_comment.

  ## Examples

      iex> create_log_post_comment(%{field: value})
      {:ok, %LogPostComment{}}

      iex> create_log_post_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_log_post_comment(attrs \\ %{}) do
    %LogPostComment{}
    |> LogPostComment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a log_post_comment.

  ## Examples

      iex> update_log_post_comment(log_post_comment, %{field: new_value})
      {:ok, %LogPostComment{}}

      iex> update_log_post_comment(log_post_comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_log_post_comment(%LogPostComment{} = log_post_comment, attrs) do
    log_post_comment
    |> LogPostComment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a log_post_comment.

  ## Examples

      iex> delete_log_post_comment(log_post_comment)
      {:ok, %LogPostComment{}}

      iex> delete_log_post_comment(log_post_comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_log_post_comment(%LogPostComment{} = log_post_comment) do
    Repo.delete(log_post_comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking log_post_comment changes.

  ## Examples

      iex> change_log_post_comment(log_post_comment)
      %Ecto.Changeset{data: %LogPostComment{}}

  """
  def change_log_post_comment(%LogPostComment{} = log_post_comment, attrs \\ %{}) do
    LogPostComment.changeset(log_post_comment, attrs)
  end
end
