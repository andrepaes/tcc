defmodule ElixirApp.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string)
      add(:last_name, :string)
      add(:birth_date, :naive_datetime)

      timestamps()
    end
  end
end
