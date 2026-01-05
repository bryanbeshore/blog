require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present? || ENV["RENDER"].present?
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.year.to_i}" }

  config.assets.compile = false

  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info").to_sym
  config.log_tags = [:request_id]

  config.active_record.dump_schema_after_migration = false

  config.force_ssl = true
  config.assume_ssl = true
end
