Rails.application.configure do

config.action_mailer.default_url_options = { :host => 'https://codecoreforhire.herokuapp.com/' }

  ActionMailer::Base.smtp_settings = {
 :user_name => ENV['SENDGRID_USERNAME'],
 :password => ENV['SENDGRID_PASSWORD'],
 :domain => 'https://codecoreforhire.herokuapp.com/',
 :address => 'smtp.sendgrid.net',
 :port => 587,
 :authentication => :plain,
 :enable_starttls_auto => true
}

  config.cache_classes = true

  config.eager_load = true


  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_files = true

  config.assets.js_compressor = :uglifier

  config.assets.compile = true

  config.assets.digest = true

  config.log_level = :debug


  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false
end
