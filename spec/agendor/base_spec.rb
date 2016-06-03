require 'spec_helper'

describe Agendor::Base, :vcr do

  context "basic auth" do

    let(:client) { Agendor::Deal.new("vikings@resultadosdigitais.com.br", "#qwe#123", "") }

    it "creates a deal" do
      expect(client.create({:title=>"Whatever Deal", :org_id=>1374940, :value => 50000})).to eq(1606637)
    end

    it "check path" do
      expect(client.resource_path).to eq('https://api.agendor.com.br/v1/deals')
    end
  end

  context "token auth" do

    context 'using only token' do

      let(:client) { Agendor::Organization.new("", "", "8a4bc1df-d464-473d-bf76-3d3d9492de5a") }

      it "creates an organization" do
      	expect(client.create({:nickname=>"Whatever@ Company Inc.", :description=>"Whatever company", :website => "www.whatever.com"})).to eq(4892685)
      end

      it "check path" do
        expect(client.resource_path).to eq('https://api.agendor.com.br/v1/organizations')
      end
    end

    context 'with user and password' do

      let(:client) { Agendor::Person.new("vikings@resultadosdigitais.com.br", "#qwe#123", "8a4bc1df-d464-473d-bf76-3d3d9492de5a") }

      it "creates a person" do
      	expect(client.create({:name=>"Whatever", :role=>"Singer", :description => "Nice guy", :emails_array=>["whateveremail@gmail.com"]})).to eq(6780540)
      end

      it "check path" do
        expect(client.resource_path).to eq('https://api.agendor.com.br/v1/people')
      end
    end
  end

end
