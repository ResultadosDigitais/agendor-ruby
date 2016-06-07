module Agendor

	class Token < Agendor::Base

		def get_token
			get = HTTParty.get(resource_path, :headers => headers)
			code = get.response.code
			raise "Response not HTTP OK: #{code} | #{get.parsed_response["message"]}" if code != "200"
			klass_object_id(get.parsed_response)
		end

		def resource_path
			"#{api_path}/auth/token"
		end

		def klass_object_id(hash)
			hash["token"]
		end

	end
end
