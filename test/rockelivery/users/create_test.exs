defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  import Rockelivery.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{name: "Matheus"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{password: "123"})

      response = Create.call(params)

      assert {:error, %Error{status: :bad_request}} = response
    end
  end
end
