class SlotsController < ApplicationController

  before_action :authenticate, only: [:index, :request_availabilities]

  def index
    @slots = Slot.currents
    @total_number_of_beds = @slots.inject(0){|res, s| res + (s.available ? s.number_of_beds : 0)}
  end

  def request_availabilities
    context = RequestAvailabilitiesForToday.call
    @number = context.number_of_volunteers_notified
    respond_to :js
  end


  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.config.http_basic_username && password == Rails.application.config.http_basic_password
    end
  end
end
