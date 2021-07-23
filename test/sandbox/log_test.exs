defmodule Sandbox.LogTest do
  use Sandbox.DataCase

  alias Sandbox.Log

  describe "log_posts_comments" do
    alias Sandbox.Log.LogPostsComments

    @valid_attrs %{numOfComments: 42}
    @update_attrs %{numOfComments: 43}
    @invalid_attrs %{numOfComments: nil}

    def log_posts_comments_fixture(attrs \\ %{}) do
      {:ok, log_posts_comments} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Log.create_log_posts_comments()

      log_posts_comments
    end

    test "list_log_posts_comments/0 returns all log_posts_comments" do
      log_posts_comments = log_posts_comments_fixture()
      assert Log.list_log_posts_comments() == [log_posts_comments]
    end

    test "get_log_posts_comments!/1 returns the log_posts_comments with given id" do
      log_posts_comments = log_posts_comments_fixture()
      assert Log.get_log_posts_comments!(log_posts_comments.id) == log_posts_comments
    end

    test "create_log_posts_comments/1 with valid data creates a log_posts_comments" do
      assert {:ok, %LogPostsComments{} = log_posts_comments} = Log.create_log_posts_comments(@valid_attrs)
      assert log_posts_comments.numOfComments == 42
    end

    test "create_log_posts_comments/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Log.create_log_posts_comments(@invalid_attrs)
    end

    test "update_log_posts_comments/2 with valid data updates the log_posts_comments" do
      log_posts_comments = log_posts_comments_fixture()
      assert {:ok, %LogPostsComments{} = log_posts_comments} = Log.update_log_posts_comments(log_posts_comments, @update_attrs)
      assert log_posts_comments.numOfComments == 43
    end

    test "update_log_posts_comments/2 with invalid data returns error changeset" do
      log_posts_comments = log_posts_comments_fixture()
      assert {:error, %Ecto.Changeset{}} = Log.update_log_posts_comments(log_posts_comments, @invalid_attrs)
      assert log_posts_comments == Log.get_log_posts_comments!(log_posts_comments.id)
    end

    test "delete_log_posts_comments/1 deletes the log_posts_comments" do
      log_posts_comments = log_posts_comments_fixture()
      assert {:ok, %LogPostsComments{}} = Log.delete_log_posts_comments(log_posts_comments)
      assert_raise Ecto.NoResultsError, fn -> Log.get_log_posts_comments!(log_posts_comments.id) end
    end

    test "change_log_posts_comments/1 returns a log_posts_comments changeset" do
      log_posts_comments = log_posts_comments_fixture()
      assert %Ecto.Changeset{} = Log.change_log_posts_comments(log_posts_comments)
    end
  end
end
