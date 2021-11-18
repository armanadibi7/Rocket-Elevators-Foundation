class Quote < ApplicationRecord
    
    after_save :create_quote_ticket

    def create_quote_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "The company #{self.company_name}", 
            :comment => { 
                :value => "The contact company #{self.company_name} 
                    can be reached at email #{self.email} and at phone number #{self.phone_number}. 
                    Building type selected is #{self.building_type} with the service type #{self.services_type}. 
                    The amount of required elevator is #{self.amount_of_elevator} and total price is #{self.total_price}.\n"
                   
            }, 
            :requester => { 
                "name": self.email, 
                "email": self.email,
            },
            :priority => "normal",
            :type => "task",
            )
    end

end
