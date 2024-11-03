defmodule ElixirAppWeb.Controllers.PrimeNumberController do
  use ElixirAppWeb, :controller

  alias ElixirApp.Primes

  def get_list(conn, %{"quantity" => quantity}) do
    {integer, _} = Integer.parse(quantity)
    Primes.get_primes(integer)

    conn
    |> send_resp(200, "")
  end

  def verify(conn, %{"number" => number}) do
    {integer, _} = Integer.parse(number)
    Primes.is_prime?(integer)

    conn
    |> send_resp(200, "")
  end
end
