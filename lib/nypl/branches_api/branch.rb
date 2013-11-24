module Nypl
  module BranchesApi
    class Branch < Sequel::Model(:branches)
      one_to_one :location, :key => :loc_id, :class => Location
      one_to_many :floors, :key => :branch_id, :class => Floor, 
        :order => :order
      def as_resource
        r = { 
          :symbol => symbol,
          :name => name,
          :address => address,
          :city => city,
          :zipcode => zipcode,
          :cross_street => xstreet,
          :lat => latitude,
          :long => longitude,
          :floors => floors.map{|f| f.as_resource},
          :_links => {
            :self => {
              :href => "/#{symbol}"
            }
          }
        }

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
