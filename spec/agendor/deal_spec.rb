require 'spec_helper'

describe Agendor::Deal, :vcr do

	let(:client) { Agendor::Deal.new("brunogh@gmail.com", "qwe123") }

  it "creates a deal" do
    expect(client.create({:title=>"Whatever Deal", :org_id=>1374940, :value => 50000})).to eq(630780)
  end

  it "check path" do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/deals')
  end

end
