class SmsParser
  def initialize(raw_twilio_params)
    @mobile_phone_number = raw_twilio_params["From"]
    @message = raw_twilio_params["Body"]
  end

  def volunteer
    Volunteer.find_by(mobile_phone_number: mobile_phone_number)
  end

  def deactivation_message?
    message.match(/stop/i).present?
  end

  def activation_message?
    message.match(/start/i).present?
  end

  def confirmation_message?
    message.match(/oui/i).present?
  end

  def cancellation_message?
    message.match(/non/i).present?
  end


  private

  attr_reader :mobile_phone_number, :message
end
