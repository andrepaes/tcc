defmodule ElixirApp.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :birthday, :date
      add :email, :string
      add :cpf, :string
      add :phone_number, :string
      add :mother_name, :string
      add :father_name, :string
      timestamps()
    end
  end
end
