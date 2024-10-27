defmodule ElixirApp do
  @moduledoc """
  ElixirApp keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defmodule Primes do
    def is_prime?(n) when n in [0, 1], do: false
    def is_prime?(n) when n in [2, 3], do: true

    def is_prime?(x) do
      start_lim = div(x, 2)

      Enum.reduce_while(2..start_lim, {true, start_lim}, fn fac, {is_prime, upper_limit} ->
        cond do
          !is_prime ->
            {:halt, {false, fac}}

          fac > upper_limit ->
            {:cont, {is_prime, upper_limit}}

          true ->
            is_prime = rem(x, fac) != 0
            upper_limit = if is_prime, do: div(x, fac + 1), else: fac
            {:cont, {is_prime, upper_limit}}
        end
      end)
      |> elem(0)
    end
  end
end
