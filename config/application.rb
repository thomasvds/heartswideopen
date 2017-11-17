require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Heartswideopen
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.http_basic_username = ENV['admin_name']
    config.http_basic_password = ENV['admin_password']
    config.messages_availability_request = "Bonjour, pouvez-vous héberger quelqu'un ce soir? Si oui, répondez OUI. FINISH pour se désinscrire. GO pour se réinscrire. NON pour annuler après OUI."
  end
end
