defmodule OnElixir.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :parent_category_id, :uuid
      add :posts_count, :integer

      timestamps()
      add :deleted_at, :naive_datetime
    end
  end
end
