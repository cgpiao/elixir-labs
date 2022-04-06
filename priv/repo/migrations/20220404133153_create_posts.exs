defmodule OnElixir.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :content, :text
      add :content_rich, :text
      add :abstract, :text
      add :abstract_rich, :text
      add :state, :string

      timestamps()
    end
  end
end
