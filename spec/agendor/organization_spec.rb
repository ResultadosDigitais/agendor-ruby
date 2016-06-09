require 'spec_helper'

describe Agendor::Organization, :vcr do

	let(:client) { Agendor::Organization.new("8a4bc1df-d464-473d-bf76-3d3d9492de5a") }

  it "creates an organization" do
  	expect(client.create({:nickname=>"Final Xundax", :description=>"A Xunda company", :website => "www.thelast.org"})).to eq(4913195)
  end

	it "gets an organization" do
    expect(client.get('Xunda Comp')).to eq(4893917)
  end

  it "check path" do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/organizations')
  end

end
