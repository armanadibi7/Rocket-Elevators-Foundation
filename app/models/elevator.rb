class Elevator < ApplicationRecord
    belongs_to :column
    before_save do
        if ((status_was != nil) and (status_was != "Intervention") and (status == "Intervention"))
            sms_tech()
        end
    end    

    # TWILIO
    def sms_tech
        # Download the helper library from https://www.twilio.com/docs/ruby/install
        require 'rubygems'
        require 'twilio-ruby'

        # Find your Account SID and Auth Token at twilio.com/console
        # and set the environment variables. See http://twil.io/secure
        account_sid = ENV["twilio_acct_id"]
        auth_token = ENV["twilio_auth"]
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+17179958791' # Your Twilio number
        to = '+15142588609' # Your mobile phone number
         
        message = @client.messages.create( 
                                     body: "The Elevator with ID: '#{self.id}' in building ID: '#{self.column.battery.building.id}' status has changed from '#{self.status_was}' to '#{self.status}'",  
                                     messaging_service_sid: ENV["messaging_sid"],      
                                     to: to
                                   ) 
         
        puts message.sid
        
    end

end

