defmodule SandboxWeb.HelloController do
  use SandboxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html") # looks for HelloView that will render the index.html.
  end

  def show(conn, %{"messenger" => messenger}) do
    #render(conn, "show.html", messenger: messenger)
    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "Dweezil")
    |> render("show.html")
  end
end
