module Agendor

  class Person < Agendor::Api
    
    def process_hash(params)
	  person = {
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