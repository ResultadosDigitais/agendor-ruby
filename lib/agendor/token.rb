# frozen_string_literal: true

module Agendor
  class Token < Agendor::Base
    def get_token
      response = HTTParty.get(resource_path, headers: headers)
      klass_object_id(response.parsed_response)
    end

    def resource_path
      "#{api_path}/auth/token"
    end

    def klass_object_id(hash)
      hash['token']
    end
  end
end
