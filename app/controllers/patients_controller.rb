class PatientsController < ApplicationController 
    def index
        @patients = Patient.all
    end 

    def new
        @patient = Patient.new
    end 

    def create 
        @patient = Patient.new(patient_params)
        @patient.appointments = Appointment.find_or_create_by(appointment_params)
        if @patient.save 
            redirect_to @patient
        else 
            render :new 
    end 
    end 

    def show 
        @patient = Patient.find(params[:id])
        render :show
    end 

    def edit 
        @patient = Patient.find(params[:id])
    end 

    def update 
        @patient = Patient.find(params[:id])
        @patient.update(patient_params)
        if @patient.save 
        redirect_to @patient 
        else 
        render :edit
    end 
    end 

    private 

    def patient_params 
        params.require(:patient).permit(:name, :age)
    end 

    def appointment_params 
      params.require(:appointment).permit(:appointment_datetime, :doctor_id, :patient_id)
    end 


end