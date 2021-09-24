defmodule Rockelivery.Repo.Migrations.AddTimestampsToOrdersAndOrdersItems do
  use Ecto.Migration

  def up do
    alter table(:orders) do
      timestamps null: true
    end

    execute """
    UPDATE orders
    SET updated_at=NOW(), inserted_at=NOW()
    """

    alter table(:orders) do
      modify :inserted_at, :naive_datetime, null: false
      modify :updated_at, :naive_datetime, null: false
    end

    alter table(:orders_items) do
      timestamps null: true
    end

    execute """
    UPDATE orders_items
    SET updated_at=NOW(), inserted_at=NOW()
    """
  end

  def down do
    alter table(:orders) do
      remove :inserted_at
      remove :updated_at
    end

    alter table(:orders_items) do
      remove :inserted_at
      remove :updated_at
    end
  end
end
