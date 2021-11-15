class Elevator < ApplicationRecord
    belongs_to :column
    before_save do
        if ((status_was != nil) and (status == "Intervention"))
            sms_tech()
        end
    end    

    # TWILIO
    def sms_tech
        # Download the helper library from https://www.twilio.com/docs/ruby/install
        require 'twilio-ruby'

        # Find your Account SID and Auth Token at twilio.com/console
        # and set the environment variables. See http://twil.io/secure
        account_sid = ENV['twilio_acct_id']
        auth_token = ENV['twilio_auth']
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+17179958791' # Your Twilio number
        to = '+15142588609' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Hey friend!"
        )
    end

end
