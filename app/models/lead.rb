require 'zendesk_api'
class Lead < ApplicationRecord

    after_save :create_lead_ticket

    def create_lead_ticket
        
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{self.full_name.titleize} from #{self.company_name.titleize}", 
            :comment => { 
                :value => "The contact #{self.full_name.titleize} from company #{self.company_name.titleize} can be reached at email  #{self.email} and at phone number #{self.phone_number}. 
                    #{self.department.titleize} has a project named #{self.project_name.titleize} which would require contribution from Rocket Elevators.
                    Project Description:  #{self.project_description.titleize}
                    Attached Message: #{self.message}
                    The Contact uploaded an attachment"
            }, 
            :requester => { 
                "name": self.email, 
                "email": self.email,
            },
            :priority => "normal",
            :type => "question"
        )
    end

end
