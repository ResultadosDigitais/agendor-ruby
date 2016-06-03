module Agendor

  class Base

    def initialize(username, password, token)
      @username = username
      @password = password
      @token = token
    end

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

    private

    def basic_auth
      auth_str = [@username,@password].join(':')
      "Basic #{Base64.encode64(auth_str)}"
    end

    def token_auth
      "Token #{@token}"
    end

    def headers
      header = { 'Content-Type' => "application/json" }
      header['Authorization'] = @token.blank? ? basic_auth.gsub("\n",'') : token_auth
      header
    end

    def api_path
      "https://api.agendor.com.br/v1"
    end

  end
end
