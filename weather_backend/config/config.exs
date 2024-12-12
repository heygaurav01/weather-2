# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :weather_backend,
  ecto_repos: [WeatherBackend.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :weather_backend, WeatherBackendWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: WeatherBackendWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: WeatherBackend.PubSub,
  live_view: [signing_salt: "OY04DGTM"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :weather_backend, WeatherBackend.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
config :weather_api, :weather_api_key, "YOUR_WEATHER_API_KEY"
config :weather_api, :weather_api_url, "https://api.openweathermap.org/data/2.5/weather"
