module Agendor

  class Entity < Agendor::Base
    def create(params)
      body = process_hash(params)
      response = HTTParty.post(resource_path, body: body.to_json, headers: headers)
      raise EntityProcessingError.new(response) unless success_response?(response.code)
      klass_object_id(response.parsed_response)
    end

    def get(query)
      response = HTTParty.get("#{resource_path}?q=#{query}", headers: headers)
      raise EntityProcessingError.new(response) unless success_response?(response.code)
      response.parsed_response
    end

    def update(entity_id, params)
      body = process_hash(params)
      response = HTTParty.put("#{resource_path}/#{entity_id}", body: body.to_json, headers: headers)
      raise EntityProcessingError.new(response) unless success_response?(response.code)
      klass_object_id(response.parsed_response)
    end

    def process_hash(params)
      params.select {|k, v| hash_keys.include?(k) }
    end

    private

    def success_response?(code)
      code.between?(200, 299)
    end

    # This response should be raised when an error occurs
    class EntityProcessingError < StandardError
      attr_reader :response

      def initialize(_message = 'Error processing Agendor entity', response)
        @response = response
      end
    end
  end
end
