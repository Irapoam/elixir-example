defmodule CommunityWeb.UsersResolver do
  alias Community.Users

  def all_users(_root, _args, _info) do
    users = Users.list_users()
    {:ok, users}
  end

  def create_user(_root, args, _info) do
    case Users.create_user(args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, "could not create user"}
    end
  end
end