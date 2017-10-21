class RequestAvailabilitiesForToday
  include Interactor

  def call
    retrieve_matching_volunteers
    schedule_notifications
    expose_results!
  end


  private

  attr_reader :volunteers

  def retrieve_matching_volunteers
    @volunteers = Volunteer.active.available_today.not_yet_queried_today
  end

  def schedule_notifications
    volunteers.each do |v|
      SmsNotificationWorker.perform_async(v.mobile_phone_number, message)
      v.mark_as_queried_today!
    end
  end

  def expose_results!
    context.number_of_volunteers_notified = volunteers.count
  end

  def message
    @message ||= Rails.application.config.messages_availability_request
  end
end
