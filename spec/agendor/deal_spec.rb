require 'spec_helper'

describe Agendor::Deal, :vcr do

	let(:client) { Agendor::Deal.new("de69397c-3aff-497a-98f3-47bb2f455d14") }

  it "creates a deal" do
    expect(client.create({:title=>"Whatever Deal", :org_id=>12821776, :value => 50000})).to eq(1613013)
  end

	it "creates a deal with specific stage order" do
    expect(client.create({:title=>"Another Whatever Deal", :org_id=>12821776, :value => 50000, :dealStageOrder => 1})).to eq(4061332)
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
    expect{client.update( 2536528394, { name: 'whatever' })}.to raise_error(Agendor::Entity::ProcessingError)
  end

  it "check path" do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/deals')
  end

end
