module Nypl
  module BranchesApi
    class Room < Sequel::Model(:locations_rooms)
      def as_resource
        r = { 
          :name => name
        }

        if !description.empty?
          r[:description] = description
        end

        return r
      end
    end
  end
end
