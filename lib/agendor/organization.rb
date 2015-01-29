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

    def klass_object_id(hash)
      hash["organizationId"]
    end

  end

end
