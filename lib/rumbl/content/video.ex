defmodule Rumbl.Content.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Content.Video


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :user, Rumbl.User

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs \\ %{}) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
