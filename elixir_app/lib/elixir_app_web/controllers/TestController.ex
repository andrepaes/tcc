defmodule ElixirAppWeb.Controllers.TestController do
  use ElixirAppWeb, :controller

  def test(conn, _params) do
    :timer.sleep(500)
    conn
    |> send_resp(200, "")
  end
end

