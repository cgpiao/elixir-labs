defmodule OnElixir.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OnElixir.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        abstract: "some abstract",
        content: "some content",
        state: "some state",
        title: "some title"
      })
      |> OnElixir.Posts.create_post()

    post
  end

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        posts_count: 42
      })
      |> OnElixir.Posts.create_tag()

    tag
  end
end
