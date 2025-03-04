# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :elixir_app,
  ecto_repos: [ElixirApp.Repo],
  generators: [timestamp_type: :utc_datetime]

config :elixir_app, ElixirApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "elixir_app_dev",
  pool_size: 100

# Configures the endpoint
config :elixir_app, ElixirAppWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: ElixirAppWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ElixirApp.PubSub,
  live_view: [signing_salt: "yaY3SVVC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
