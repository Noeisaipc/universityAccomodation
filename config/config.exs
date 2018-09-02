# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :universityAccomodation,
  ecto_repos: [UniversityAccomodation.Repo]

# Configures the endpoint
config :universityAccomodation, UniversityAccomodationWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dosJWgSCwbkTZqZb9SOYujGdZJw4V6US+pEweEyHWQE3B1aP2TxlARyFBiNjn8bF",
  render_errors: [view: UniversityAccomodationWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UniversityAccomodation.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
