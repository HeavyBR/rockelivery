defmodule Rockelivery.Repo.Migrations.RemoveTimestampFromOrdersItems do
  use Ecto.Migration

  def change do
    alter table(:orders_items) do
      remove :inserted_at
      remove :updated_at
    end
  end
end
