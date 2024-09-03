FROM elixir:1.17.2-otp-27-alpine

RUN mix local.hex --force && \
    mix local.rebar --force

COPY . .

RUN mix do deps.get, deps.compile

CMD ["mix", "phx.server"]
