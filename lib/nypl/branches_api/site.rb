module Nypl
  module BranchesApi
    class Site < Sequel::Model(:locations_spaces)

      def as_resource
        { 
          :id => sid,
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
