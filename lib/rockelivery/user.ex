defmodule Rockelivery.User do
  use Ecto.Schema
  alias Ecto.Changeset
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:age, :address, :cep, :cpf, :email, :password, :name]

  @required_update_params @required_params -- [:password]

  @derive {Jason.Encoder, only: [:id, :age, :cpf, :address, :email]}

  schema "users" do
    field :age, :integer
    field :address, :string
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  # changeset for update
  def changeset(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_update_params)
    |> validate_length(:cpf, is: 11)
    |> validate_length(:cep, is: 8)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> handle_password(params)
  end

  def handle_password(changeset, params) do
    case Map.get(params, :password) do
      nil -> changeset
      _value -> changeset |> validate_length(:password, min: 6) |> put_password_hash()
    end
  end

  # changeset for create
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:cpf, is: 11)
    |> validate_length(:cep, is: 8)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
