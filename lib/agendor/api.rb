module Agendor
  
  class Api

    def initialize(username, password)
      @username = username
      @password = password
    end

    def create(params)
      body = process_hash(params)
      post = HTTParty.post(resource_path, :body => body.to_json, :headers => headers, :basic_auth => auth)
      code = post.response.code
      raise "Response not HTTP OK: #{code}" if code != "201"
      code
    end

    def api_path
      "https://api.agendor.com.br/v1/"
    end

    private

    def auth
      {:username => @username, :password => @password}
    end

    def headers
      { 'Content-Type' => "application/json" }
    end

  end
end
