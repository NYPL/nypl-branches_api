module Nypl
  module BranchesApi
    class Room < Sequel::Model(:rooms)
      def as_resource
        r = { 
          :name => name
        }

        if !description.nil?
          r[:description] = description
        end

        return r
      end
    end
  end
end
