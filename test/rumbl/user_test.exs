defmodule Rumbl.UserTest do
  use Rumbl.DataCase, async: true
  alias Rumbl.User

  @valid_attrs %{name: "A User", username: "eva"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do 
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do 
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset does not accept long usernames" do  
    attrs = Map.put(@valid_attrs, :username, String.duplicate("a", 30))
    changeset = User.changeset(%User{}, attrs)
    refute changeset.valid?
  end

  test "registration_changeset password must be at least 6 chars long" do
    attrs = Map.put(@valid_attrs, :password, "12345")
    changeset = User.registration_changeset(%User{}, attrs)
    assert %{password: ["should be at least 6 character(s)"]} = errors_on(changeset)
  end

  test "registration_changeset with valid attributes hashes password" do 
    attrs = Map.put(@valid_attrs, :password, "123456")
    changeset = User.registration_changeset(%User{}, attrs)
    %{password: pass, password_hash: pass_hash} = changeset.changes

    assert changeset.valid?
    assert pass_hash
    assert Comeonin.Argon2.checkpw(pass, pass_hash)
  end
end
