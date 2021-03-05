# frozen_string_literal: true

module Agendor
  class Deal < Agendor::Entity
    def hash_keys
      %i[
        organization
        person
        user
        dealStage
        dealStatus
        dealStageOrder
        userOwner
        title
        description
        startTime
        endTime
        ranking
        value
        products
      ]
    end

    def resource_path
      "#{api_path}/deals"
    end

    def klass_object_id(hash)
      hash['dealId']
    end
  end
end
