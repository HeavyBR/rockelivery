defmodule Rockelivery.Factory do
  use ExMachina

  alias Rockelivery.User

  def user_params_factory do
    %{
      "age" => 27,
      "address" => "Rua Colombo, 40",
      "cep" => "13274777",
      "email" => "teste@teste.com",
      "password" => "123456",
      "name" => "Matheus",
      "cpf" => "23412345678",
      "cep" => "13274000"
    }
  end

  def user_struct_factory do
    %User{
      age: 27,
      address: "Rua Colombo, 40",
      cep: "13274777",
      email: "teste@teste.com",
      password: "123456",
      name: "Matheus",
      cpf: "23412345678"
    }
  end
end
