defmodule SandboxWeb.LogPostCommentController do
  use SandboxWeb, :controller

  alias Sandbox.Logs
  alias Sandbox.Logs.LogPostComment

  def index(conn, _params) do
    log_post_comment = Logs.list_log_post_comment()
    render(conn, "index.html", log_post_comment: log_post_comment)
  end

  def new(conn, _params) do
    changeset = Logs.change_log_post_comment(%LogPostComment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"log_post_comment" => log_post_comment_params}) do
    case Logs.create_log_post_comment(log_post_comment_params) do
      {:ok, log_post_comment} ->
        conn
        |> put_flash(:info, "Log post comment created successfully.")
        |> redirect(to: Routes.log_post_comment_path(conn, :show, log_post_comment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    log_post_comment = Logs.get_log_post_comment!(id)
    render(conn, "show.html", log_post_comment: log_post_comment)
  end

  def edit(conn, %{"id" => id}) do
    log_post_comment = Logs.get_log_post_comment!(id)
    changeset = Logs.change_log_post_comment(log_post_comment)
    render(conn, "edit.html", log_post_comment: log_post_comment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "log_post_comment" => log_post_comment_params}) do
    log_post_comment = Logs.get_log_post_comment!(id)

    case Logs.update_log_post_comment(log_post_comment, log_post_comment_params) do
      {:ok, log_post_comment} ->
        conn
        |> put_flash(:info, "Log post comment updated successfully.")
        |> redirect(to: Routes.log_post_comment_path(conn, :show, log_post_comment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", log_post_comment: log_post_comment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    log_post_comment = Logs.get_log_post_comment!(id)
    {:ok, _log_post_comment} = Logs.delete_log_post_comment(log_post_comment)

    conn
    |> put_flash(:info, "Log post comment deleted successfully.")
    |> redirect(to: Routes.log_post_comment_path(conn, :index))
  end
end
