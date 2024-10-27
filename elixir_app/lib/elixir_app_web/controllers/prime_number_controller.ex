defmodule ElixirAppWeb.Controllers.PrimeNumberController do
  use ElixirAppWeb, :controller

  def verify(conn, %{"number" => number}) do
    {integer, _} = Integer.parse(number)
    ElixirApp.Primes.is_prime?(integer)

    conn
    |> send_resp(200, "")
  end
end
