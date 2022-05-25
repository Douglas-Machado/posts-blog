defmodule Blog.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:name, :email]

  @fields_to_export ~w(name email)a
  @derive{Jason.Encoder, only: @fields_to_export}

  schema "users" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(:email)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/)
  end
end
