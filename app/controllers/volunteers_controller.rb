class VolunteersController < ApplicationController
  before_action :authenticate, only: [:index]

  def new
    @volunteer = Volunteer.new
  end

  def index
    @volunteers = Volunteer.all
  end

  def create
    @volunteer = Volunteer.new volunteer_params
    if @volunteer.save
      flash[:success] = "Merci pour votre soutien, #{@volunteer.nickname}. Nous vous contacterons bientôt avec des propositions."
    else
      flash[:danger] = "Erreur(s) dans votre enregistrement"
    end
    redirect_to root_path
  end


  private

  def volunteer_params
    params.require(:volunteer).permit(:nickname, :email, :address, :mobile_phone_number,
      :available_mon, :available_tue, :available_wed, :available_thu,
      :available_fri, :available_sat, :available_sun, :number_of_beds, :can_be_driver)
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.config.http_basic_username && password == Rails.application.config.http_basic_password
    end
  end
end
