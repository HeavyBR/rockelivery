defmodule Rockelivery.Repo.Migrations.CreateOrdersTable do
  use Ecto.Migration

  def change do
      create table("orders") do
        add :address, :string, null: false
        add :comments, :string
        add :payment_method, :payment_method, null: false
        add :user_id, references(:users, type: :binary_id), null: false
      end
  end
end
