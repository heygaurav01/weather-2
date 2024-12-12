import Config

# Configure your database
config :weather_api, WeatherApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "weather_api_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
config :weather_api, WeatherApiWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "your_dev_secret_key_base",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:weather_api, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:weather_api, ~w(--watch)]}
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
