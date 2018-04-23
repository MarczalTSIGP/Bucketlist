require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ENV.update YAML.load_file('config/application.yml')[Rails.env] rescue {}

module Bucketlist
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

     config.time_zone = 'Brasilia'

     config.i18n.enforce_available_locales = false
     config.i18n.available_locales = ["pt-BR"]
     config.i18n.default_locale = :'pt-BR'
  end
end
