defmodule OnElixir.Posts.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :description, :string
    field :name, :string
    field :posts_count, :integer

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :description, :posts_count])
    |> validate_required([:name, :description, :posts_count])
  end
end
