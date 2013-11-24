module Nypl
  module BranchesApi
    class Branch < Sequel::Model(:branches)
#      one_to_one :location, :key => :sid, :class => Location
#      one_to_many :levels, :key => :sid, :class => Level, :order => :weight
      def as_resource
        { 
          :symbol => symbol,
          :name => name,
          :address => address,
          :city => city,
          :zipcode => zipcode,
          :cross_street => xstreet,
          :lat => latitude,
          :long => longitude,
 #         :levels => levels.map{|l| l.as_resource},
 #         :_links => {
 #           :self => {
 #             :href => "/#{location.symbol}"
 #           }
 #         }
        }

      end
    end
  end
end
