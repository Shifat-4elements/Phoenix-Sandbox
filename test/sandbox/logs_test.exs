defmodule Sandbox.LogsTest do
  use Sandbox.DataCase

  alias Sandbox.Logs

  describe "log_post_comment" do
    alias Sandbox.Logs.LogPostComment

    @valid_attrs %{numOfComments: 42}
    @update_attrs %{numOfComments: 43}
    @invalid_attrs %{numOfComments: nil}

    def log_post_comment_fixture(attrs \\ %{}) do
      {:ok, log_post_comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Logs.create_log_post_comment()

      log_post_comment
    end

    test "list_log_post_comment/0 returns all log_post_comment" do
      log_post_comment = log_post_comment_fixture()
      assert Logs.list_log_post_comment() == [log_post_comment]
    end

    test "get_log_post_comment!/1 returns the log_post_comment with given id" do
      log_post_comment = log_post_comment_fixture()
      assert Logs.get_log_post_comment!(log_post_comment.id) == log_post_comment
    end

    test "create_log_post_comment/1 with valid data creates a log_post_comment" do
      assert {:ok, %LogPostComment{} = log_post_comment} = Logs.create_log_post_comment(@valid_attrs)
      assert log_post_comment.numOfComments == 42
    end

    test "create_log_post_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Logs.create_log_post_comment(@invalid_attrs)
    end

    test "update_log_post_comment/2 with valid data updates the log_post_comment" do
      log_post_comment = log_post_comment_fixture()
      assert {:ok, %LogPostComment{} = log_post_comment} = Logs.update_log_post_comment(log_post_comment, @update_attrs)
      assert log_post_comment.numOfComments == 43
    end

    test "update_log_post_comment/2 with invalid data returns error changeset" do
      log_post_comment = log_post_comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Logs.update_log_post_comment(log_post_comment, @invalid_attrs)
      assert log_post_comment == Logs.get_log_post_comment!(log_post_comment.id)
    end

    test "delete_log_post_comment/1 deletes the log_post_comment" do
      log_post_comment = log_post_comment_fixture()
      assert {:ok, %LogPostComment{}} = Logs.delete_log_post_comment(log_post_comment)
      assert_raise Ecto.NoResultsError, fn -> Logs.get_log_post_comment!(log_post_comment.id) end
    end

    test "change_log_post_comment/1 returns a log_post_comment changeset" do
      log_post_comment = log_post_comment_fixture()
      assert %Ecto.Changeset{} = Logs.change_log_post_comment(log_post_comment)
    end
  end
end
