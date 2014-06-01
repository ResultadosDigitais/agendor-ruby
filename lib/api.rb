class Api

  URL = "https://api.agendor.com.br/v1/people"

  def initialize(username, password)
    @username = username
    @password = password
  end

  def add_person(params)
    person = {
        "name" => params[:name],
        "role" => params[:role],
        "emails" => params[:emails_array],
        "description" => params[:description]
    }
    post = HTTParty.post(URL, :body => person.to_json, :headers => headers, :basic_auth => auth)
    code = post.response.code
    raise "Response not HTTP OK: #{code}" if code != "201"
    code
  end

  private

  def auth
    {:username => @username, :password => @password}
  end

  def headers
    { 'Content-Type' => "application/json" }
  end

end
