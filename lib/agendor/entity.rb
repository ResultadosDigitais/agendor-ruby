module Agendor

  class Entity < Agendor::Base

    def create(params)
      body = process_hash(params)
      post = HTTParty.post(resource_path, :body => body.to_json, :headers => headers)
      code = post.response.code
      raise "Response not HTTP OK: #{code} | #{post.parsed_response["message"]}" if code != "201"
      klass_object_id(post.parsed_response)
    end

    def process_hash(params)
      params.select {|k, v| hash_keys.include?(k) }
    end

  end
end
