
class InterventionController < ApplicationController
    

 def getBuildings
  @building = Building.where(customer_id: params[:id])
 

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
   get_zendesk_values
  
  #  if params[:column_id] == "null"
  #   @intervention.column_id == nil
  #  end
  #  @intervention.column_id == nil
  #  @intervention.elevator_id == nil
  #  @intervention.employee_id == nil
   @intervention.intervention_start = nil
   @intervention.intervention_end = nil
   @intervention.result = "Pending"
   @intervention.status = "Pending"
   
   
   
#Begin
#ROLLBACK
   
   if @intervention.save
    puts @intervention.column_id
    create_lead_ticket
     redirect_to root_path, flash: {success: "Your Intervention has been successfully submitted"}
   else 
    errors_stack = @intervention.errors.messages
   puts errors_stack
     
   end
end
 def intervention_params
   params.permit(:customer_id,:building_id,:battery_id,:column_id,:elevator_id,:employee_id,:report)
 end
end
def create_lead_ticket
  client = ZendeskAPI::Client.new do |config|
      config.url = ENV['ZENDESK_URL']
      config.username = ENV['ZENDESK_USERNAME']
      config.token = ENV['ZENDESK_TOKEN']
  end
  ZendeskAPI::Ticket.create!(client, 
      :subject => "Intervention Request From: #{@zendesk_user} ", 
      :comment => { 
          :value => "The User has requested an Intervention with the Following Informations:\nCustomer : " + params[:customer_id] + " - " + @zendesk_customer +
         "\nBuilding Admin : " + params[:building_id] + " - " + @zendesk_building +
         "\nBattery : " + params[:battery_id] + " - " + @zendesk_batteries +
         "\nColumn : " + @zendesk_column+
         "\nElevator : " + @zendesk_elevators +
         "\nEmployee Assigned To Case: "+ @zendesk_employee +
         "\nDescription : " + params[:report] 
      }, 
      :requester => { 
          "name": @zendesk_user, 
          "email": @zendesk_user 
      },
      :priority => "normal",
      :type => "question"
  )
end


def get_zendesk_values

  @zendesk_user = User.find(current_user.id).email

  @zendesk_building = Building.find(params[:building_id]).admin_name
  @zendesk_customer = Customer.find(params[:customer_id]).company_name
  @zendesk_batteries = Battery.find(params[:battery_id]).status


if params[:employee_id] == "null"

  @intervention.employee =nil
  @zendesk_employee = "Not Provided"
else
  @zendesk_employee =params[:employee_id] + " - " + Employee.find(params[:employee_id]).last_name

end

if params[:column_id] == "null"

  @intervention.column_id = nil
  @zendesk_column = "Not Provided"
else
  @zendesk_column = params[:column_id] + " - " + Column.find(params[:column_id]).status
 
end

if params[:elevator_id] == "null"
  @intervention.elevator = nil
  @zendesk_elevators = "Not Provided"
 else
  @zendesk_elevators = params[:elevator_id] + " - " + Elevator.find(params[:elevator_id]).status

end

end
