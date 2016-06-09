require 'spec_helper'

describe Agendor::Deal, :vcr do

	let(:client) { Agendor::Deal.new("8a4bc1df-d464-473d-bf76-3d3d9492de5a") }

  it "creates a deal" do
    expect(client.create({:title=>"Whatever Deal", :org_id=>1374940, :value => 50000})).to eq(1613013)
  end

	it "gets a deal" do
    response = client.get('Whatever Deal')
    deal_id = response.first['dealId']
    expect(deal_id).to eq(1606328)
  end

  it "gets an inexistent deal" do
    response = client.get('98rhv98hgi3gji3gkwdl')
    expect(response.first).not_to be
  end

  it "updates a deal" do
    expect(client.update( 1606328, { title: 'Whatever Deal', description: 'Eita DEAL!' })).to eq(1606328)
  end

  it "updates an inexistent deal" do
    expect{client.update( 2536528394, { name: 'whatever' })}.to raise_error
  end

  it "check path" do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/deals')
  end

end
