class IncomingSmsHandlingWorker
  include Sidekiq::Worker

  def perform(mobile_phone_number, message)
    @mobile_phone_number = mobile_phone_number
    @message = message

    return unless volunteer.present?

    if parser.deactivation_message?
      volunteer.deactivate!
      notify_deactivation
    elsif parser.activation_message?
      volunteer.activate!
      notify_activation
    elsif parser.confirmation_message?
      volunteer.confirm_slot_for_today!
      notify_confirmation
    elsif parser.cancellation_message?
      volunteer.cancel_slot_for_today!
      notify_cancellation
    end
  end


  private

  attr_reader :mobile_phone_number, :message, :volunteer

  def parser
    @parser ||= SmsParser.new(mobile_phone_number, message)
  end

  def volunteer
    @volunteer ||= parser.volunteer
  end

  def notify_deactivation
  end

  def notify_activation
  end

  def notify_confirmation
  end

  def notify_cancellation
  end
end
