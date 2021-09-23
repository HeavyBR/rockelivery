defmodule Rockelivery.Error do
  @keys [:status, :result]

  @enforce_keys @keys
  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_user_not_found_error, do: build(:not_found, %{message: "User not found"})

  def build_cannot_delete_user_error,
    do: build(:internal_server_error, %{message: "Cannot delete user"})
end
