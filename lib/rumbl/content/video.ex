defmodule Rumbl.Content.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Content.Video


  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Category

    timestamps()
  end

  @required_fields ~w(url title description category_id)
  @optional_fields ~w(category_id)

  @doc false
  def changeset(%Video{} = video, attrs \\ %{}) do
    video
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:url, :title, :description, :category_id])
    |> assoc_constraint(:category)
  end
end
