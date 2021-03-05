# frozen_string_literal: true

require 'spec_helper'

describe Agendor::Deal, :vcr do
  let(:client) { Agendor::Deal.new('de69397c-3aff-497a-98f3-47bb2f455d14') }

  it 'creates a deal' do
    expect(client.create({ title: 'Whatever Deal', org_id: 12_821_776, value: 50_000 })).to eq(1_613_013)
  end

  it 'creates a deal with specific stage order' do
    expect(client.create({ title: 'Another Whatever Deal', org_id: 12_821_776, value: 50_000,
                           dealStageOrder: 1 })).to eq(4_061_332)
  end

  it 'gets a deal' do
    response = client.get('Whatever Deal')
    deal_id = response.first['dealId']
    expect(deal_id).to eq(1_606_328)
  end

  it 'gets an inexistent deal' do
    response = client.get('98rhv98hgi3gji3gkwdl')
    expect(response.first).not_to be
  end

  it 'updates a deal' do
    expect(client.update(1_606_328, { title: 'Whatever Deal', description: 'Eita DEAL!' })).to eq(1_606_328)
  end

  it 'updates an inexistent deal' do
    expect { client.update(2_536_528_394, { name: 'whatever' }) }.to raise_error(Agendor::Entity::ProcessingError)
  end

  it 'check path' do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/deals')
  end
end
