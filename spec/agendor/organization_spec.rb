# frozen_string_literal: true

require 'spec_helper'

describe Agendor::Organization, :vcr do
  let(:client) { Agendor::Organization.new('8a4bc1df-d464-473d-bf76-3d3d9492de5a') }

  it 'creates an organization' do
    expect(client.create({ nickname: 'Final Xundax', description: 'A Xunda company',
                           website: 'www.thelast.org' })).to eq(4_913_195)
  end

  it 'gets an organization' do
    response = client.get('Xunda Comp')
    org_id = response.first['organizationId']
    expect(org_id).to eq(4_893_917)
  end

  it 'gets an inexistent organization' do
    response = client.get('98rhv98hgi3gji3gkwdl')
    expect(response.first).not_to be
  end

  it 'updates an organization' do
    expect(client.update(4_893_917, { description: 'Eita Organization!' })).to eq(4_893_917)
  end

  it 'updates an inexistent organization' do
    expect { client.update(2_536_528_394, { name: 'whatever' }) }.to raise_error(Agendor::Entity::ProcessingError)
  end

  it 'check path' do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/organizations')
  end
end
