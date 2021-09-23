defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  import Rockelivery.Factory

  describe "changeset/2" do
    test "when all new are valid, returns a valid changeset" do
      new = build(:user_params)

      response = User.changeset(new)

      assert %Changeset{changes: %{name: "Matheus"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given values" do
      user = build(:user_struct)

      new = build(:user_params, %{name: "new_name"})

      response = User.changeset(user, new)

      assert %Changeset{valid?: true, changes: new} = response
    end

    test "when there are some error, returns an invalid changeset" do
      wrong_params = build(:user_params, %{cpf: "123"})

      response = User.changeset(wrong_params)

      expected_response =  %{cpf: ["should be 11 character(s)"]}

      assert errors_on(response) == expected_response
    end
  end
end
