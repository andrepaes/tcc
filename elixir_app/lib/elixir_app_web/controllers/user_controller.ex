defmodule ElixirAppWeb.Controllers.UserController do
  use ElixirAppWeb, :controller

  def index(conn, _) do
    :timer.sleep(500)

    conn
    |> send_resp(200, "")
  end
end
