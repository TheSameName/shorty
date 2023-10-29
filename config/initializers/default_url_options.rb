host = ENV.fetch("HOST") { "localhost:3000" }

# Set the correct protocol as SSL isn't configured in development or test.
protocol = Rails.application.config.force_ssl ? "https" : "http"

Rails.application.routes.default_url_options.merge!(
  host:,
  protocol:
)
