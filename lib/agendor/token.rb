# frozen_string_literal: true

module Agendor
  class Token < Agendor::Base
    def get_token
      response = client.get(resource_path) do |req|
        req.headers = headers
      end
      klass_object_id(JSON.parse(response.body))
    end

    def resource_path
      "#{api_path}/auth/token"
    end

    def klass_object_id(hash)
      hash['token']
    end
  end
end
