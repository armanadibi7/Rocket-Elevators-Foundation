class HomeController < ApplicationController
    def index

        @lead = Lead.new

    end

    def create

      @lead = Lead.new(lead_params)

      if params[:lead][:upload]
        @lead.attachment = params[:lead][:upload].read
      end
      
      
      
      if @lead.save
           
        # flash[:success] = "Your Quote has been successfully submitted    "

        ThankYouMailer.send_thank_you_email(@lead).deliver       
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