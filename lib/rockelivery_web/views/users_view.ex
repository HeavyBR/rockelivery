defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "Success",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}) do
    %{
      message: "Success",
      user: user
    }
  end
end
