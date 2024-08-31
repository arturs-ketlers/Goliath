require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Goliath
  class Application < Rails::Application
    config.encoding = "utf-8"
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = ENV['AVAILABLE_LOCALES'].to_s.split(',')
    config.i18n.default_locale = ENV['DEFAULT_LOCALE']
    config.i18n.fallbacks = true
  end
end
