class AppointmentController < ApplicationController
  def new
    @appointment = Appointment.new
    pet_id = params[:pet_id]
    @pet = Pet.find_by(id: pet_id)
  end

  def create
    pet = Pet.find(params[:pet_id])
    new_appointment = Appointment.new(appointment_params)
    if new_appointment.save
      pet.appointments << new_appointment
      redirect_to pet_appointment_path(pet, new_appointment)
    else
      flash[:error] = new_appointment.errors.full_messages.join(", ")
      redirect_to new_pet_appointment_path(pet)
    end
  end
  private
  def appointment_params
    params.require(:appointment).permit(:veterinarian, :time, :reason)
  end
end
