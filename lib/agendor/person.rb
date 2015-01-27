module Agendor

  class Person < Agendor::Base

    def hash_keys
    [
      :personId,
      :category,
      :organization,
      :phones,
      :emails,
      :social,
      :address,
      :userOwner,
      :name,
      :role,
      :ranking,
      :cpf
    ]
    end

   def resource_path
     "#{api_path}/people"
   end

  def object_id(hash)
    hash["personId"]
  end

 end

end