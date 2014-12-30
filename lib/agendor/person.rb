module Agendor

  class Person < Agendor::Base
    
    def process_hash(params)
	{
	  "name" => params[:name],
	  "role" => params[:role],
	  "emails" => params[:emails_array],
	  "description" => params[:description]
	}
	end

   	def resource_path
  	  "#{api_path}/people"
	end

  end

end