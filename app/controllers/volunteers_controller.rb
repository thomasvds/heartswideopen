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
      redirect_to root_path
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      flash[:error] = "Erreur dans votre enregistrement"
      render "new"
    end
  end


  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :email, :address, :mobile_phone_number,
      :available_mon, :available_tue, :available_wed, :available_thu,
      :available_fri, :available_sat, :available_sun, :number_of_beds)
  end
end
