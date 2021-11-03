
class QuoteController < ApplicationController
    
    def getData
        flash[:success] = ""
        quote = Quote.new

        #Customer Info
        quote.company_name = params['company_name']
        # quote.last_name = params['last_name']
        quote.email = params['email']
        quote.phone_number = params['phone_number']
   
        #Building Type
        quote.building_type = params["buildings"]

        # Elevator Type
        quote.services_type = params["radioSelect"]
        # Building Info
        quote.apartments = params["num_of_apts"]
        quote.floors = params["num_of_floors"]
        quote.basements = params["num_of_basements"]
        quote.companies = params["num_of_companies"]
        quote.parking_spots = params["num_of_parking"]
        quote.elevators = params["num_of_elevators"]
        quote.corporations = params["num_of_corporations"]
        quote.maximum_occupancy = params["max_occupancy"]
        quote.business_hours = params["business_hours"]
        
        #Price
        quote.total_price = params["total_price"].to_s
        
        quote.amount_of_elevator = params["amntElevator"]
        quote.price_per_elevator = params["priceElevator"]
        quote.installation = params["installation_fee"]
        quote.price_elevator_total = params["priceElevatorTotal"]
           

        if quote.save
           
            # flash[:success] = "Your Quote has been successfully submitted    "
            
            redirect_to root_path, flash: {success: "Your quote has been successfully submitted"}
         else
        
        
         
          end
     
    end

    
end
