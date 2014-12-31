module Agendor

  class Organization < Agendor::Base

  	def hash_keys
    [ 
      :nickname, 
      :phones, 
      :emails, 
      :social, 
      :address, 
      :legalName, 
      :cnpj, 
      :description, 
      :website
    ]
    end

    def resource_path
     "#{api_path}/organizations"
   end

 end

end