defmodule OnElixir.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OnElixir.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name",
        parent_category_id: "7488a646-e31f-11e4-aace-600308960662",
        posts_count: 42
      })
      |> OnElixir.Categories.create_category()

    category
  end
end
