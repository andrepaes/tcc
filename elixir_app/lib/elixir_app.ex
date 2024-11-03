defmodule ElixirApp do
  @moduledoc """
  ElinirApp keeps the contents that define your domain
  and business logic.

  Contents are also responsible for managing your data, regardless
  if it comes from the database, an enternal API or others.
  """

  defmodule Primes do
    def get_primes(n) when n < 2, do: []
    def get_primes(n), do: Enum.filter(2..n, &is_prime?/1)

    def is_prime?(n) when n in [0, 1], do: false
    def is_prime?(n) when n in [2, 3], do: true

    def is_prime?(n) do
      half = div(n, 2)

      Enum.reduce_while(2..half, true, fn candidate, _ ->
        if rem(n, candidate) == 0 do
          {:halt, false}
        else
          {:cont, true}
        end
      end)
    end

    # def is_prime?(n) do
    #  half = div(n, 2)
    #
    #  Enum.reduce_while(2..half, {true, half}, fn fac, {is_prime, upper_limit} ->
    #    cond do
    #      !is_prime ->
    #        {:halt, {false, fac}}
    #
    #      fac > upper_limit ->
    #        {:cont, {is_prime, upper_limit}}
    #
    #      true ->
    #        is_prime = rem(n, fac) != 0
    #        upper_limit = if is_prime, do: div(n, fac + 1), else: fac
    #        {:cont, {is_prime, upper_limit}}
    #    end
    #  end)
    #  |> elem(0)
    # end
  end
end
