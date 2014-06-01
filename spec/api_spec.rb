require 'spec_helper'

describe "Api", :vcr do

  it "creates a person" do
    client = Api.new("brunogh@gmail.com", "qwe123")
    client.add_person({:name=>"Whatever", :role=>"Singer", :description => "Nice guy", :emails_array=>["whateveremail@gmail.com"]}).should eq("201")
  end
end
