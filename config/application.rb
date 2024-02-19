require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require "sprockets/railtie"

module FtpMvc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.autoloader = :classic
    # config.assets.precompile += %w( application.css )

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.to_prepare do
      # Devise::SessionsController.layout "your_layout_name"
      Devise::RegistrationsController.layout "application"
      # Devise::ConfirmationsController.layout "your_layout_name"
      # Devise::UnlocksController.layout "your_layout_name"
      # Devise::PasswordsController.layout "your_layout_name"
    end
    config.generators do |generate|
      generate.test_framework  :rspec,
                               fixtures: true,
                               view_specs: false,
                               helper_specs: false,
                               routing_specs: false,
                               controller_specs: false
                               # request_specs: false
      # generate.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
