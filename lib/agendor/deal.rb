module Agendor

	class Deal < Agendor::Base
		
		def hash_keys 
		[
			:organization, 
			:person, 
			:user, 
			:dealStage, 
			:dealStatus, 
			:userOwner, 
			:title, 
			:description, 
			:startTime, 
			:endTime, 
			:ranking, 
			:value, 
			:products, 
		]
		end
		
		def resource_path
			"#{api_path}/deals"
		end

		def klass_object_id(hash)
			hash["dealId"]
		end

	end

end