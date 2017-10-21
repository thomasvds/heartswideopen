class SmsNotificationWorker
  include Sidekiq::Worker

  def perform(mobile_phone, message)
    @mobile_phone = mobile_phone
    @message = message
    return unless Rails.application.config.twilio_sms_active
    begin
      client.messages.create(
        from: twilio_number,
        to: mobile_phone,
        body: message
      )
    rescue Twilio::REST::RequestError => e
      Rails.logger.error "Twilio error: #{e.message}"
    end
  end


  private

  attr_reader :mobile_phone, :message

  def client
    @client ||= Twilio::REST::Client.new
  end

  def twilio_number
    @twilio_number ||= Rails.application.config.twilio_phone_number
  end
end
