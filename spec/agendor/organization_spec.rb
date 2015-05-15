require 'spec_helper'

describe Agendor::Organization, :vcr do

	let(:client) { Agendor::Organization.new("brunogh@gmail.com", "qwe123") }

  it "creates an organization" do
  	expect(client.create({:nickname=>"Whatever@ Company Inc.", :description=>"Whatever company", :website => "www.whatever.com"})).to eq(2133232)
  end

  it "check path" do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/organizations')
  end

end
