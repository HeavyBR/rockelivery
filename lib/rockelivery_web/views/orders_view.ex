defmodule RockeliveryWeb.OrdersView do
  use RockeliveryWeb, :view

  alias Rockelivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Success",
      order: order
    }
  end

  def render("order.json", %{order: %Order{} = order}) do
    %{
      message: "Success",
      order: order
    }
  end
end
