# frozen_string_literal: true

module Agendor
  class Entity < Agendor::Base
    def create(params)
      body = process_hash(params)
      response = client.post(resource_path, body.to_json, headers)
      code = response.status
      raise UnauthorizedError, response if code == 401
      raise ProcessingError, response unless success_response?(code)

      klass_object_id(JSON.parse(response.body))
    end

    def get(query)
      response = client.get("#{resource_path}?q=#{query}") do |req|
        req.headers = headers
      end

      code = response.status
      raise UnauthorizedError, response if code == 401
      raise ProcessingError, response unless success_response?(code)

      JSON.parse(response.body)
    end

    def update(entity_id, params)
      body = process_hash(params)
      response = client.put("#{resource_path}/#{entity_id}", body.to_json, headers)
      code = response.status
      raise UnauthorizedError, response if code == 401
      raise ProcessingError, response unless success_response?(code)

      klass_object_id(JSON.parse(response.body))
    end

    def process_hash(params)
      params.select { |k, _v| hash_keys.include?(k) }
    end

    private

    def success_response?(code)
      code.between?(200, 299)
    end

    class ProcessingError < StandardError
      attr_reader :response

      def initialize(_message = 'Error processing Agendor entity', response)
        @response = response
      end
    end
  end
end
