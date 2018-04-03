module Agendor

  class Base

    def initialize(token, username = '', password = '')
      @username = username
      @password = password
      @token = token
    end

    private

    def basic_auth
      auth_str = [@username,@password].join(':')
      "Basic #{Base64.strict_encode64(auth_str)}"
    end

    def token_auth
      "Token #{@token}"
    end

    def headers
      header = { 'Content-Type' => "application/json" }
      header['Authorization'] = (@token.nil? || @token.empty?) ? basic_auth : token_auth
      header
    end

    def api_path
      "https://api.agendor.com.br/v1"
    end
  end

  class UnauthorizedError < StandardError
    attr_reader :response

    def initialize(message = 'Unauthorized request', response)
      @response = response
    end
  end
end
