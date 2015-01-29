require 'spec_helper'

describe "Agendor::Person", :vcr do

  it "creates a person" do
    client = Agendor::Person.new("brunogh@gmail.com", "qwe123")
    client.create({:name=>"Whatever", :role=>"Singer", :description => "Nice guy", :emails_array=>["whateveremail@gmail.com"]}).should eq("201")
  end
end