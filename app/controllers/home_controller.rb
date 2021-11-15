class HomeController < ApplicationController
    def index

        @lead = Lead.new

    end

    def create

      @lead = Lead.new(lead_params)
     
      @lead.attachment = params[:lead][:upload].read
      folders = DropboxApi::Client.new('sl.A8WNQ9CaEFdomaP435BwXkRAo8VQRaZCvu0gwtp-M8gxk1UNnYlfsHLBcwTyoFLSJeXUZd0Yi-PJ4NpNCMtfd2I7sNsgmaeIiypem-mF2FHAUilA3S7U_54mM2vcDPijD34zjjgSAslY')
      
       folders.upload "/"+params[:lead][:full_name] +"/"+ params[:lead][:upload].original_filename , @lead.attachment ,:mode => :add

       @lead.attachment = ''
      if @lead.save
           
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