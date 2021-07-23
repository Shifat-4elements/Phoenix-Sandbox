defmodule SandboxWeb.LogPostCommentControllerTest do
  use SandboxWeb.ConnCase

  alias Sandbox.Logs

  @create_attrs %{numOfComments: 42}
  @update_attrs %{numOfComments: 43}
  @invalid_attrs %{numOfComments: nil}

  def fixture(:log_post_comment) do
    {:ok, log_post_comment} = Logs.create_log_post_comment(@create_attrs)
    log_post_comment
  end

  describe "index" do
    test "lists all log_post_comment", %{conn: conn} do
      conn = get(conn, Routes.log_post_comment_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Log post comment"
    end
  end

  describe "new log_post_comment" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.log_post_comment_path(conn, :new))
      assert html_response(conn, 200) =~ "New Log post comment"
    end
  end

  describe "create log_post_comment" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.log_post_comment_path(conn, :create), log_post_comment: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.log_post_comment_path(conn, :show, id)

      conn = get(conn, Routes.log_post_comment_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Log post comment"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.log_post_comment_path(conn, :create), log_post_comment: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Log post comment"
    end
  end

  describe "edit log_post_comment" do
    setup [:create_log_post_comment]

    test "renders form for editing chosen log_post_comment", %{conn: conn, log_post_comment: log_post_comment} do
      conn = get(conn, Routes.log_post_comment_path(conn, :edit, log_post_comment))
      assert html_response(conn, 200) =~ "Edit Log post comment"
    end
  end

  describe "update log_post_comment" do
    setup [:create_log_post_comment]

    test "redirects when data is valid", %{conn: conn, log_post_comment: log_post_comment} do
      conn = put(conn, Routes.log_post_comment_path(conn, :update, log_post_comment), log_post_comment: @update_attrs)
      assert redirected_to(conn) == Routes.log_post_comment_path(conn, :show, log_post_comment)

      conn = get(conn, Routes.log_post_comment_path(conn, :show, log_post_comment))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, log_post_comment: log_post_comment} do
      conn = put(conn, Routes.log_post_comment_path(conn, :update, log_post_comment), log_post_comment: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Log post comment"
    end
  end

  describe "delete log_post_comment" do
    setup [:create_log_post_comment]

    test "deletes chosen log_post_comment", %{conn: conn, log_post_comment: log_post_comment} do
      conn = delete(conn, Routes.log_post_comment_path(conn, :delete, log_post_comment))
      assert redirected_to(conn) == Routes.log_post_comment_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.log_post_comment_path(conn, :show, log_post_comment))
      end
    end
  end

  defp create_log_post_comment(_) do
    log_post_comment = fixture(:log_post_comment)
    %{log_post_comment: log_post_comment}
  end
end
