Twilio.configure do |config|
  config.account_sid = ENV['twilio_account_sid']
  config.auth_token = ENV['twilio_auth_token']
end

Rails.application.config.twilio_phone_number = '+32460207670'
