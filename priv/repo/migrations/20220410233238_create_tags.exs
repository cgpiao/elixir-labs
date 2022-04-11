defmodule OnElixir.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :description, :text
      add :posts_count, :integer

      timestamps()
      add :deleted_at, :naive_datetime
    end
  end
end
