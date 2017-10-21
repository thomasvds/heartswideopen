class IncomingSmsHandlingWorker
  include Sidekiq::Worker

  def perform(raw_twilio_params)
    @raw_twilio_params = raw_twilio_params

    return unless volunteer.present?

    if parser.deactivation_message?
      volunteer.deactivate!
      notify_deactivation
    elsif parser.activation_message?
      volunteer.activate!
      notify_desactivation
    elsif parser.confirmation_message?
      volunteer.confirm_slot_for_today!
      notify_confirmation
    elsif parser.cancellation_message?
      volunteer.cancel_slot_for_today!
      notify_cancellation
    end
  end


  private

  attr_reader :raw_twilio_params, :volunteer

  def parser
    @parser ||= SmsParser.new(raw_twilio_params)
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
