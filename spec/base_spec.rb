require 'spec_helper'

describe "Agendor::Base", :vcr do

  describe "initialize" do
  	it "raises error when called from Agendor::Base" do
  		expect { Agendor::Base.new("brunogh@gmail.com", "qwe123") }.to raise_error("You must initialize it through a subclass!")
  	end

  end

end
