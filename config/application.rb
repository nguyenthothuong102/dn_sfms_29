require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SoccerField
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**',
                                '*.{rb,yml}')]
    config.autoload_paths << Rails.root.join('assets')
    config.i18n.available_locales = [:en, :vi]
    config.i18n.default_locale = :en
  end
end
