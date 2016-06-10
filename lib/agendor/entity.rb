module Agendor

  class Entity < Agendor::Base

    def create(params)
      body = process_hash(params)
      post = HTTParty.post(resource_path, :body => body.to_json, :headers => headers)
      code = post.response.code
      raise "Response not HTTP OK: #{code} | #{post.response.body}" if code != "201"
      klass_object_id(post.parsed_response)
    end

    def get(query)
      get = HTTParty.get("#{resource_path}?q=#{query}", :headers => headers)
      code = get.response.code
      raise "Response not HTTP OK: #{code} | #{get.response.body}" if code != "200"
      get.parsed_response
    end

    def update(entity_id, params)
      body = process_hash(params)
      put = HTTParty.put("#{resource_path}/#{entity_id}",:body => body.to_json, :headers => headers)
      code = put.response.code
      raise "Response not HTTP OK: #{code} | #{put.response.body}" if code != "200"
      klass_object_id(put.parsed_response)
    end

    def process_hash(params)
      params.select {|k, v| hash_keys.include?(k) }
    end

  end
end
