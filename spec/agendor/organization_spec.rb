require 'spec_helper'

describe "Agendor::Organization", :vcr do

  it "creates an organization" do
    client = Agendor::Organization.new("brunogh@gmail.com", "qwe123")
    client.create({:nickname=>"Whatever Company Inc.", :description=>"Whatever company", :website => "www.whatever.com"}).should eq("201")
  end
end
