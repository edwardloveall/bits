Rails.application.configure do
  config.action_controller.asset_host = ENV.fetch("ASSET_HOST", ENV.fetch("HOST"))
  config.action_controller.perform_caching = true
  config.action_mailer.default_url_options = { host: ENV.fetch("HOST") }
  config.action_mailer.delivery_method = :smtp
  config.active_support.deprecation = :notify
  config.assets.compile = false
  config.assets.digest = true
  config.assets.js_compressor = :uglifier
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.eager_load = true
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :debug
  config.middleware.use Rack::Deflater
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.static_cache_control = "public, max-age=#{1.year.to_i}"
end
