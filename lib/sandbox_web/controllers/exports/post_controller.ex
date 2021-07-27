defmodule Sandbox.Exports.PostController do
  use SandboxWeb, :controller

  alias Sandbox.Posts
  alias Sandbox.Repo

  def index(conn, _params) do
    posts = Posts.list_posts()

    conn
    |> put_resp_content_type("text/xlsx")
    |> put_resp_header("content-disposition", "attachment; filename=posts_report.xlsx")
    |> render("report.xlsx", %{posts: posts})
  end
end
