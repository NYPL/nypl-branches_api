module Nypl
  module BranchesApi
    class Floor < Sequel::Model(:floors)
      one_to_many :rooms, :key => :floor_id, :class => Room
      def as_resource
        r = { 
          :name => name,
          :description => description
        }

        if !rooms.empty?
          r[:rooms] = rooms.map{|r| r.as_resource}
        end

        return r
      end
    end
  end
end
