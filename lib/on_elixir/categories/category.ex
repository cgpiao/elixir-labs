defmodule OnElixir.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :parent_category_id, Ecto.UUID
    field :posts_count, :integer

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :parent_category_id, :posts_count])
    |> validate_required([:name, :parent_category_id, :posts_count])
  end
end
