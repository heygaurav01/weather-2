import Config

# General application configuration
config :weather_api,
  ecto_repos: [WeatherApi.Repo]

# Configures the endpoint
config :weather_api, WeatherApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: WeatherApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: WeatherApi.PubSub,
  live_view: [signing_salt: "your_signing_salt"]

# Configure esbuild
config :esbuild,
  version: "0.17.11",
  weather_api: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind
config :tailwind,
  version: "3.4.0",
  weather_api: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
