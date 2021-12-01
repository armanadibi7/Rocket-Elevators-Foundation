
class InterventionController < ApplicationController
    

 def getBuildings
   @building = Building.where("customer_id = ?", params[:id])
   respond_to do |format|
     format.json { render :json => @building }
   end
 end
 def getBattery
   @batteries = Battery.where(building_id: params[:id])

   respond_to do |format|
      format.json { render :json => @batteries }
    end
   
 end
 def getColumn
   @column = Column.where(battery_id: params[:id])

   respond_to do |format|
      format.json { render :json => @column }
    end
   
 end
 def getElevator
   @elevators = Elevator.where(column_id: params[:id])

   respond_to do |format|
      format.json { render :json => @elevators }
    end
   
 end
 def getEmployee
   @employee = Employee.all

   respond_to do |format|
      format.json { render :json => @employee }
    end
   
 end
    
def submit 

   @intervention = Intervention.new(intervention_params)
   @intervention.user_id = current_user.id
   if params[:column_id] == "null"
    @intervention.column_id == nil
   end
   @intervention.column_id == nil
   @intervention.elevator_id == nil
   @intervention.employee_id == nil
   @intervention.intervention_start = nil
   @intervention.intervention_end = nil
   @intervention.result = "Pending"
   @intervention.status = "Pending"
   @intervention.save
#Begin
#ROLLBACK
   errors_stack = @intervention.errors.messages
   puts errors_stack
   if @intervention.save
     redirect_to root_path, flash: {success: "Your Intervention has been successfully submitted"}
   else 
      @intervention.errors.messages
   end
end
 def intervention_params
   params.permit(:customer_id,:building_id,:battery_id,:column_id,:elevator_id,:employee_id,:report)
 end
end
