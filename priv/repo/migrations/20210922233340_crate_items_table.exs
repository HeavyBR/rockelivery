defmodule Rockelivery.Repo.Migrations.CrateItemsTable do
  use Ecto.Migration

  def change do
    create table("items") do
      add :category, :item_category, null: false
      add :description, :string, null: false
      add :price, :decimal, null: false
      add :photo, :string, null: false

      timestamps()
    end
  end
end
