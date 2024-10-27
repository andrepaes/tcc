defmodule ElixirAppWeb.Router do
  use ElixirAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirAppWeb.Controllers do
    pipe_through :api

    get("/primes/verify", PrimeNumberController, :verify)
  end
end
