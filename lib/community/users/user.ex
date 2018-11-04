defmodule Community.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :function, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :function])
    |> validate_required([:name, :function])
  end
end
