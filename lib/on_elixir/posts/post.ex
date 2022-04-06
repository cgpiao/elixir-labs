defmodule OnElixir.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "posts" do
    field :abstract, :string
    field :abstract_rich, :string
    field :content, :string
    field :content_rich, :string
    field :state, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :content_rich, :abstract, :abstract_rich, :state])
    |> validate_required([:title, :content, :content_rich, :abstract, :abstract_rich, :state])
  end
end
