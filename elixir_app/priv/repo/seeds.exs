# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirApp.Repo.insert!(%ElixirApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

1..10_000
|> Enum.map(fn _ ->
  %{
    name: "test",
    birthday: Date.from_iso8601!("2020-01-01"),
    email: "test@gmail.com",
    cpf: "14461782778",
    phone_number: "11999999999",
    mother_name: "Maria",
    father_name: "João",
    inserted_at: now,
    updated_at: now
  }
end)
|> Enum.chunk_every(1000)
|> Enum.each(fn chunk ->
  ElixirApp.Repo.insert_all(ElixirApp.User, chunk)
  IO.puts("Inserted 1000 records")
end)
