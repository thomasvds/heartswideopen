class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end

  def index
    @volunteers = Volunteer.all
  end

  def create
    @volunteer = Volunteer.new volunteer_params
    if @volunteer.save!
      flash[:success] = "Merci pour votre soutien, #{@volunteer.first_name}!"
    else
      flash[:error] = "Erreur dans votre enregistrement"
    end
    redirect_to root_path
  end


  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :address, :mobile_phone_number,
      :available_mon, :available_tue, :available_wed, :available_thu,
      :available_fri, :available_sat, :available_sun, :number_of_beds)
  end
end
