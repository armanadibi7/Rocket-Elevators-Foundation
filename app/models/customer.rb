class Customer < ApplicationRecord
    belongs_to :address
    belongs_to :user, optional: true
    has_many :buildings
    after_create :just_created

    private

    def just_created
         Lead.all.each do |found_lead|
                if found_lead.email == contact_email
                  
              
                  name = company_contact_name
                  filename = found_lead.filename
  
                      if filename != ''
  
                      folders = DropboxApi::Client.new(ENV['dropbox_token'])
                      
                      previous_attachement = found_lead.attachment
                      folders.upload "/" + name  +"/"+ filename, previous_attachement ,:mode => :add
                      found_lead.attachment = ''
                      found_lead.filename =''
                      found_lead.save
                      end
              end
          end
          
     
    
    end
 
end
