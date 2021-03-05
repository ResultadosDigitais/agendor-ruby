# frozen_string_literal: true

require 'spec_helper'

describe Agendor::Person, :vcr do
  let(:client) { Agendor::Person.new('f437bd57-a4e6-4dc1-a9b1-5278008e6e0e') }

  it 'creates a person' do
    expect(client.create(name: 'Xunderson', role: 'Singer', description: 'Nice guy',
                         emails_array: ['xunderson@example.org'])).to eq(6_874_083)
  end

  it 'gets a person' do
    response = client.get('johnybegud@example.org')
    personId = response.first['personId']
    expect(personId).to eq(6_785_354)
  end

  it 'gets an inexistent person' do
    response = client.get('98rhv98hgi3gji3gkwdl')
    expect(response.first).not_to be
  end

  it 'updates a person' do
    expect(client.update(6_785_354, name: 'johna')).to eq(6_785_354)
  end

  it 'updates an inexistent person' do
    expect { client.update(2_536_528_394, name: 'whatever') }.to raise_error(Agendor::Entity::ProcessingError)
  end

  it 'check path' do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/people')
  end

  it 'creates a person with telephone on description' do
    expect(client.create(name: 'Xunderson',
                         role: 'Singer',
                         description: 'Nice guy',
                         emails_array: ['xunderson@example.org'],
                         phone: '48 9999-9999')).to eq(14_410_037)
  end
end
