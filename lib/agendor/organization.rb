# frozen_string_literal: true

module Agendor
  class Organization < Agendor::Entity
    def hash_keys
      %i[
        nickname
        phones
        emails
        social
        address
        legalName
        cnpj
        description
        website
      ]
    end

    def resource_path
      "#{api_path}/organizations"
    end

    def klass_object_id(hash)
      hash['organizationId']
    end
  end
end
