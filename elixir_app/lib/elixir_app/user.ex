defmodule ElixirApp.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :birthday, :date
    field :email, :string
    field :cpf, :string
    field :phone_number, :string
    field :mother_name, :string
    field :father_name, :string

    timestamps()
  end
end
