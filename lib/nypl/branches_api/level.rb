module Nypl
  module BranchesApi
    class Level < Sequel::Model(:locations_levels)
      one_to_many :rooms, :key => :fid, :class => Room
      def as_resource
        r = { 
          :name => name
        }

        if !rooms.empty?
          r[:rooms] = rooms.map{|r| r.as_resource}
        end

        return r
      end
    end
  end
end
