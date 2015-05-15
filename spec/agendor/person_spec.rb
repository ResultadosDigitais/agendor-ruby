require 'spec_helper'

describe Agendor::Person, :vcr do

	let(:client) { Agendor::Person.new("brunogh@gmail.com", "qwe123") }

  it "creates a person" do
  	expect(client.create({:name=>"Whatever", :role=>"Singer", :description => "Nice guy", :emails_array=>["whateveremail@gmail.com"]})).to eq(1492437)
  end

  it "check path" do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/people')
  end

end