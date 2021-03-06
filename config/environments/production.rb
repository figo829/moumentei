# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.log_level = :error

config.action_view.cache_template_loading = true
# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"
config.action_controller.session_store = :active_record_store
config.action_mailer.raise_delivery_errors = false
config.action_mailer.delivery_method = :sendmail

begin
require 'rack-cache' unless defined?(::Rack::Cache)
rescue LoadError
puts 'cannot load rack-cache'
end

path = Rails.root.join('config/system_configuration.rb')
eval(IO.read(path), binding, path) if File.exists?(path)
