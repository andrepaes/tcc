defmodule ElixirAppWeb.Router do
  use ElixirAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirAppWeb.Controllers do
    pipe_through :api

    get("/primes/verify", PrimeNumberController, :verify)
    get("/primes/:quantity", PrimeNumberController, :get_list)
  end
end
