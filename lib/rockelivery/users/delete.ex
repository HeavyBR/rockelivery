defmodule Rockelivery.Users.Delete do
  alias Rockelivery.{Error, Repo, User}

  def call(id) do
    with %User{} = user <- Repo.get(User, id),
         {:ok, %User{} = user} <- Repo.delete(user) do
      {:ok, user}
    else
      {:error, _changeset} ->
        {:error, Error.build_cannot_delete_user_error()}

      nil ->
        {:error, Error.build_user_not_found_error()}
    end
  end
end
