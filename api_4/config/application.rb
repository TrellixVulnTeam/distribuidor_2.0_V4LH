require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Api
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]

    config.before_configuration do
        I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
        I18n.locale = :'pt-BR'
        I18n.default_locale = :'pt-BR'
        config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
        config.i18n.locale = :'pt-BR'
        # bypasses rails bug with i18n in production\
        I18n.reload!
        config.i18n.reload!
    end
    
    config.after_initialize do
      UserEventConfirmation.start_invites_schedule
    end
    
    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"
    
    config.autoload_paths += %W(#{config.root}/lib)
    
#    config.active_record.whitelist_attributes = false
  end
end
