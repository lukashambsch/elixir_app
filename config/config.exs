# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_app,
  ecto_repos: [ElixirApp.Repo]

# Configures the endpoint
config :elixir_app, ElixirAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A6OlaUV5OT4p8ykM38Xv4ds2YDCVL/e8BlaMpQ9FqjqqPjB9sqdS/jm2o7ug7j03",
  render_errors: [view: ElixirAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: ElixirApp.Coherence.User,
  repo: ElixirApp.Repo,
  module: ElixirApp,
  web_module: ElixirAppWeb,
  router: ElixirAppWeb.Router,
  messages_backend: ElixirAppWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Lukas Hambsch",
  email_from_email: "lukas.hambsch@gmail.com",
  opts: [:authenticatable, :recoverable, :trackable, :unlockable_with_token, :registerable]

config :coherence, ElixirAppWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%

config :ex_admin,
  repo: ElixirApp.Repo,
  module: ElixirAppWeb,
  modules: [
    ElixirApp.ExAdmin.Dashboard,
    ElixirApp.ExAdmin.Coherence.User
  ]

config :xain, :after_callback, {Phoenix.HTML, :raw}

