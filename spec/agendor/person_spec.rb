require 'spec_helper'

describe Agendor::Person, :vcr do

	let(:client) { Agendor::Person.new("8a4bc1df-d464-473d-bf76-3d3d9492de5a") }

  it "creates a person" do
  	expect(client.create({:name=>"Xunderson", :role=>"Singer", :description => "Nice guy", :emails_array=>["xunderson@example.org"]})).to eq(6874083)
  end

	it "gets a person" do
    expect(client.get('johnybegud@example.org')).to eq(6785354)
  end

  it "updates a person" do
    expect(client.update( 6785354, { name: 'johna' })).to eq(6785354)
  end

  it "check path" do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/people')
  end

end
