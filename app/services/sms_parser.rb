class SmsParser
  def initialize(mobile_phone_number, message)
    @mobile_phone_number = mobile_phone_number
    @message = message
  end

  def volunteer
    Volunteer.find_by(mobile_phone_number: mobile_phone_number)
  end

  def deactivation_message?
    message.match(/finish/i).present?
  end

  def activation_message?
    message.match(/go/i).present?
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
