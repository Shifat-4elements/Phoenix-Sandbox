defmodule Sandbox.Exports.PostView do
  use SandboxWeb, :view

alias Elixlsx.{Workbook, Sheet}

@header [
    "ID",
    "Title",
    "Body",
    "Number of comments"
  ]
def render("report.xlsx", %{posts: posts}) do
    report_generator(posts)
    |> Elixlsx.write_to_memory("report.xlsx")
    |> elem(1)
    |> elem(1)
  end
def report_generator(posts) do
    rows = posts |> Enum.map(&(row(&1)))
    %Workbook{sheets: [%Sheet{name: "Posts", rows: [@header] ++ rows}]}
  end
def row(post) do
    [
      post.id,
      post.title,
      post.body,
      post.log_post_comment.numOfComments
    ]
  end
end
