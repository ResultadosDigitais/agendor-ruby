module Agendor

  class Entity < Agendor::Base

    def create(params)
      body = process_hash(params)
      HTTParty.post(resource_path, body: body.to_json, headers: headers)
    end

    def get(query)
      HTTParty.get("#{resource_path}?q=#{query}", headers: headers)
    end

    def update(entity_id, params)
      body = process_hash(params)
      HTTParty.put("#{resource_path}/#{entity_id}", body: body.to_json, headers: headers)
    end

    def process_hash(params)
      params.select {|k, v| hash_keys.include?(k) }
    end

  end
end
