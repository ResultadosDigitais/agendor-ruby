require 'spec_helper'

describe "Agendor::Organization", :vcr => { record: :all } do

  it "creates an organization" do
    client = Agendor::Organization.new("brunogh@gmail.com", "qwe123")
    client.create({:nickname=>"Whatever X", :description=>"Whatever company", :website => "www.whatever.com"}).should eq("201")
  end
end