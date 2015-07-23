# config/development.rb
Rails.application.configure do
  # mailcatcher config
  #   to view emails generated in development:
  #   `gem install mailcatcher && mailcatcher`
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: "localhost",
    port: 1025
  }

  config.action_mailer.default_url_options = {
    host: "localhost",
    port: 3000
  }
end
