module Nypl
  module BranchesApi
    class Room < Sequel::Model(:rooms)
      one_to_one :location, :key => :loc_id, :class => Location
      def as_resource
        r = { 
          :name => name
        }

        if !description.nil?
          r[:description] = description
        end

        if !location.nil?
          if location.contacts?
            r[:contacts] = location.contacts
          end
        end

        return r
      end
    end
  end
end
