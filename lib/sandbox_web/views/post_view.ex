defmodule SandboxWeb.PostView do
  use SandboxWeb, :view

  alias Sandbox.Posts
  alias Elixlsx.{Workbook, Sheet}

  def get_comments_count(post_id) do
    Posts.get_number_of_comments(post_id)
  end
end
