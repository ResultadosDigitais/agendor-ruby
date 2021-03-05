# frozen_string_literal: true

module Agendor
  class Person < Agendor::Entity
    def hash_keys
      %i[
        personId
        category
        organization
        description
        phones
        emails
        social
        address
        userOwner
        name
        role
        ranking
        cpf
        phone
      ]
    end

    def resource_path
      "#{api_path}/people"
    end

    def klass_object_id(hash)
      hash['personId']
    end
  end
end
