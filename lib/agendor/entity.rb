module Agendor

  class Entity < Agendor::Base

    SUCCESS_RESPONSE_CODE = /2\d\d/

    def create(params)
      body = process_hash(params)
      response = HTTParty.post(resource_path, body: body.to_json, headers: headers)
      raise EntityProcessingError.new(response) unless response =~ SUCCESS_RESPONSE_CODE
    end

    def get(query)
      response = HTTParty.get("#{resource_path}?q=#{query}", headers: headers)
      raise EntityProcessingError.new(response) unless response =~ SUCCESS_RESPONSE_CODE
    end

    def update(entity_id, params)
      body = process_hash(params)
      response = HTTParty.put("#{resource_path}/#{entity_id}", body: body.to_json, headers: headers)
      raise EntityProcessingError.new(response) unless response =~ SUCCESS_RESPONSE_CODE
    end

    def process_hash(params)
      params.select {|k, v| hash_keys.include?(k) }
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
