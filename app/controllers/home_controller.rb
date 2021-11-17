class HomeController < ApplicationController
  def index

      @lead = Lead.new

  end

  def create


    @lead = Lead.new(lead_params)
   
    if params[:lead][:upload]
      @lead.attachment = params[:lead][:upload].read
      @lead.filename = params[:lead][:upload].original_filename
    end
    
    if User.exists?(:email => params[:lead][:email])
          Lead.all.each do |found_lead|
              if found_lead.email == params[:lead][:email] 
            
                name = found_lead.full_name
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
        folders = DropboxApi::Client.new(ENV['dropbox_token'])
        folders.upload "/" + params[:lead][:full_name]+"/"+ params[:lead][:upload].original_filename, @lead.attachment,:mode => :add
        @lead.attachment = ''
        @lead.filename = ''
    end
  
    if @lead.save
      ThankYouMailer.send_thank_you_email(@lead).deliver   
      # flash[:success] = "Your Quote has been successfully submitted    "

      
      redirect_to root_path, flash: {success: "Your Message has been successfully submitted"}
    end
    
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pin
    @lead = Lead.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lead_params
    params.require(:lead).permit(:full_name,:email,:phone_number,:company_name,:project_name,:project_description,:department,:message)
  end
end