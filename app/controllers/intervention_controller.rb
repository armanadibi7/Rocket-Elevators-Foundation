
class InterventionController < ApplicationController
    

 def getBuildings
   @courses = Building.where("customer_id = ?", params[:id])
   respond_to do |format|
     format.json { render :json => @courses }
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
    
end
