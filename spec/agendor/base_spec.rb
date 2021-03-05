# frozen_string_literal: true

require 'spec_helper'

describe Agendor::Base, :vcr do
  context 'token auth' do
    let(:client) { Agendor::Deal.new('8a4bc1df-d464-473d-bf76-3d3d9492de5a') }

    it 'creates a deal' do
      expect(client.create({ title: 'Whatever xunda Deal', org_id: 1_374_944,
                             value: 50_000 })).to eq(1_613_012)
    end
  end

  context 'basic auth' do
    context 'without token' do
      let(:client) { Agendor::Organization.new('', 'vikings@resultadosdigitais.com.br', '#qwe#123') }

      it 'creates an organization' do
        expect(client.create({ nickname: 'Xunda Company Co.5', description: 'Whatever xunda company comes...',
                               website: 'www.whateverxunda.com' })).to eq(4_913_187)
      end
    end

    context 'with token' do
      let(:client) do
        Agendor::Person.new('8a4bc1df-d464-473d-bf76-3d3d9492de5a', 'vikings@resultadosdigitais.com.br', '#qwe#123')
      end

      it 'creates a person' do
        expect(client.create({ name: 'Xunderson Jr da silva', role: 'RDoer', description: 'No more Mr. Nice guy',
                               emails_array: ['whateveremailxunda@gmail.com'] })).to eq(6_874_082)
      end
    end

    context 'with nil token param' do
      let(:client) { Agendor::Organization.new(nil, 'vikings@resultadosdigitais.com.br', '#qwe#123') }

      it 'raises validation error' do
        expect(client.create({ nickname: 'Xunda Company xundaCO.3', description: 'Whatever company xunda comes 2...',
                               website: 'www.whateverxundinha2.com' })).to eq(4_913_188)
      end
    end

    context 'without token param' do
      let(:client) { Agendor::Organization.new('vikings@resultadosdigitais.com.br', '#qwe#123') }

      it 'raises validation error' do
        expect do
          client.create({ nickname: 'Xunda Company 3 comes xunda makers', description: 'Whatever xundasso company',
                          website: 'www.whateverxundoers.com' })
        end.to raise_error(Agendor::UnauthorizedError)
      end
    end
  end
end
