module Nypl
  module BranchesApi
    class Site < Sequel::Model(:locations_spaces)
      one_to_one :location, :key => :sid, :class => Location
      def as_resource
        { 
          :abbrev => location.symbol,
          :name => name,
          :address => address,
          :city => city,
          :zipcode => zipcode,
          :cross_street => xstreet,
          :lat => latitude,
          :long => longitude
        }

      end
    end
  end
end
