defmodule SandboxWeb.Router do
  use SandboxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HelloWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SandboxWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/posts", PostController do
      post "/comment", PostController, :add_comment
    end

    resources "/log_post_comment", LogPostCommentController
  end

  scope "/exports", as: :exports, alias: Sandbox.Exports do
    pipe_through :browser
    resources "/posts", PostController, only: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", SandboxWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SandboxWeb.Telemetry
    end
  end
end
