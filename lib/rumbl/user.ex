defmodule Rumbl.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.User

  schema "users" do
  	field :name, :string
  	field :username, :string
  	field :password, :string, virtual: true
  	field :password_hash, :string

  	timestamps()
  end

  def changeset(user, params \\ %{}) do
  	user
  	|> cast(params, ~w(name username), [])
    |> validate_length(:username, min: 1, max: 20)
  end
end