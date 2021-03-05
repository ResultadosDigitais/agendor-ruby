# frozen_string_literal: true

require 'spec_helper'

describe Agendor::Token, :vcr do
  let(:client) { Agendor::Token.new('8a4bc1df-d464-473d-bf76-3d3d9492de5a') }

  context 'valid token' do
    it 'returns token' do
      expect(client.get_token).to eq('8a4bc1df-d464-473d-bf76-3d3d9492de5a')
    end
  end

  context 'invalid token' do
    let(:client_invalid) { Agendor::Token.new('xunda') }

    it 'returns nil' do
      response = client_invalid.get_token
      expect(response).to be_nil
    end
  end

  it 'check path' do
    expect(client.resource_path).to eq('https://api.agendor.com.br/v1/auth/token')
  end
end
