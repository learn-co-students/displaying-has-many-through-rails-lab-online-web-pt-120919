class AppointmentsController < ApplicationController 
    def index
        @appointments = Appointment.all
    end 

    def new
        @appointment = Appointment.new 
    end 

    def create 
        @appointment = Appointment.new(appointment_params)
       
        if @appointment.save 
            redirect_to @appointment
        else 
            render :new 
    end 
    end 

    def show 
        @appointment = Appointment.find(params[:id])
        render :show
    end 

    def edit 
        @appointment = Appointment.find(params[:id])
    end 

    def update 
        @appointment = Appointment.find(params[:id]) #find this instance
        @appointment.update(appointment_params) #update the instance
        if @appointmnet.save  #if this updated instance persists since it meets all permitted params
        redirect_to @doctor #redirect to this instance
        else 
        render :edit #else render edit page again
    end 
    end 

    private 

    def appointment_params 
        params.require(:appointment).permit(:appointment_datetime, :doctor_id, :patient_id)
    end 
    

end 