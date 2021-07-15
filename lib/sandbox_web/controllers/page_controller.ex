defmodule SandboxWeb.PageController do
  use SandboxWeb, :controller

  def index(conn, _params) do
    #render(conn, "index.html")
    conn
    |> put_layout(false)
    |> render("index.html")
  end
end
