class RequestAvailabilitiesForToday
  include Interactor

  def call
    retrieve_matching_volunteers
    schedule_notifications
  end


  private

  attr_reader :volunteers

  def retrieve_matching_volunteers
    @volunteers = Volunteer.active.available_today
  end

  def schedule_notifications
    volunteers.each do |v|
      SmsNotificationWorker.perform_later(v.mobile_phone_number, message)
    end
  end

  def message
    @message ||= Rails.application.config.messages_availability_request
  end
end
