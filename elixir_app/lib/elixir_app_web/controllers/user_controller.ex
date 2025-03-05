defmodule ElixirAppWeb.Controllers.UserController do
  use ElixirAppWeb, :controller

  alias ElixirApp.Repo

  def index(conn, _) do
    Ecto.Adapters.SQL.query(Repo, "select id from users")

    conn
    |> send_resp(200, "")
  end
end
