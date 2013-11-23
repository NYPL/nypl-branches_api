module Nypl
  module BranchesApi
    class Level < Sequel::Model(:locations_levels)
      def as_resource
        { 
          :name => name
        }
      end
    end
  end
end
