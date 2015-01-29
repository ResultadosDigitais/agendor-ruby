require 'spec_helper'

describe "Agendor::Deal", :vcr do

  it "creates a deal" do
    client = Agendor::Deal.new("brunogh@gmail.com", "qwe123")
    client.create({:title=>"Whatever Deal", :org_id=>1374940, :value => 50000}).should eq("201")
  end
end