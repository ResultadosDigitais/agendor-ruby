module Agendor

  class Organization < Agendor::Base
    
    def process_hash(params)
	{
	  "nickname" => params[:name],
	  "description" => params[:description],
	  "website" => params[:website],
	}
	end

   	def resource_path
  	  "#{api_path}/organizations"
	end

  end

end