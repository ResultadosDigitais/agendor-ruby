module Agendor

  class Base

    def initialize(username, password)
      @username = username
      @password = password
    end

    def create(params)
      body = process_hash(params)
      post = HTTParty.post(resource_path, :body => body.to_json, :headers => headers, :basic_auth => auth)
      code = post.response.code
      raise "Response not HTTP OK: #{code} | #{post.parsed_response["message"]}" if code != "201"
      klass_object_id(post.parsed_response)
    end

    def process_hash(params)
      params.select {|k, v| hash_keys.include?(k) }
    end

    private

    def auth
      {username: @username, password: @password}
    end

    def headers
      { 'Content-Type' => "application/json" }
    end

    def api_path
      "https://api.agendor.com.br/v1"
    end

  end
end
