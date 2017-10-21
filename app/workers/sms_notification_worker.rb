class SmsNotificationWorker
  include Sidekiq::Worker

  def perform(attributes)
    set_variables(attributes)
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

  def set_variables(attributes)
    @mobile_phone = attributes['mobile_phone']
    @message = attributes['message']
  end

  def client
    @client ||= Twilio::REST::Client.new
  end

  def twilio_number
    @twilio_number ||= Rails.application.config.twilio_phone_number
  end
end
