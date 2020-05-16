class DoctorsController < ApplicationController 
    def index
        @doctors = Doctor.all
    end 

    def new
        @doctor = Doctor.new 
    end 

    def create 
        @doctor = Doctor.new(doctor_params)
        @doctor.appointments = Appointment.find_or_create_by(appointment_params)
        if @doctor.save 
            redirect_to @doctor
        else 
            render :new 
    end 
    end 

    def show 
        @doctor = Doctor.find(params[:id])
        render :show
    end 

    def edit 
        @doctor = Doctor.find(params[:id])
    end 

    def update 
        @doctor = Doctor.find(params[:id])
        @doctor.update(doctor_params)
        if @doctor.save 
        redirect_to @doctor 
        else 
        render :edit
    end 
    end 

    private 

    def doctor_params 
        params.require(:doctor).permit(:appointment_datetime, :doctor_id, :patient_id)
    end 

end 