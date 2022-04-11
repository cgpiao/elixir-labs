defmodule OnElixir.PostsTest do
  use OnElixir.DataCase

  alias OnElixir.Posts

  describe "posts" do
    alias OnElixir.Posts.Post

    import OnElixir.PostsFixtures

    @invalid_attrs %{abstract: nil, content: nil, state: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{abstract: "some abstract", content: "some content", state: "some state", title: "some title"}

      assert {:ok, %Post{} = post} = Posts.create_post(valid_attrs)
      assert post.abstract == "some abstract"
      assert post.content == "some content"
      assert post.state == "some state"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{abstract: "some updated abstract", content: "some updated content", state: "some updated state", title: "some updated title"}

      assert {:ok, %Post{} = post} = Posts.update_post(post, update_attrs)
      assert post.abstract == "some updated abstract"
      assert post.content == "some updated content"
      assert post.state == "some updated state"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end

  describe "tags" do
    alias OnElixir.Posts.Tag

    import OnElixir.PostsFixtures

    @invalid_attrs %{description: nil, name: nil, posts_count: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Posts.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Posts.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{description: "some description", name: "some name", posts_count: 42}

      assert {:ok, %Tag{} = tag} = Posts.create_tag(valid_attrs)
      assert tag.description == "some description"
      assert tag.name == "some name"
      assert tag.posts_count == 42
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", posts_count: 43}

      assert {:ok, %Tag{} = tag} = Posts.update_tag(tag, update_attrs)
      assert tag.description == "some updated description"
      assert tag.name == "some updated name"
      assert tag.posts_count == 43
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_tag(tag, @invalid_attrs)
      assert tag == Posts.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Posts.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Posts.change_tag(tag)
    end
  end
end
