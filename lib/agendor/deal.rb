module Agendor

  class Deal < Agendor::Base
    
    def process_hash(params)
	{
	  "title" => params[:title],
	  "organization" => params[:org_id],
	  "value" => params[:value]
	}
	end

   	def resource_path
  	  "#{api_path}/deals"
	end

  end

end