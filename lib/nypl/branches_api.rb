require "sequel"
require "sinatra"
require "sinatra/jsonp"
require "nypl/branches_api/site"
require "nypl/branches_api/version"

module Nypl
  module BranchesApi
    class App < Sinatra::Base
      helpers Sinatra::Jsonp

      get '/' do
        locations = Nypl::BranchesApi::Site.all 
        
        response = {
          :branches => locations.map { |s|
            s.as_resource
          },
          :box => bounding_box(locations)
        }

        jsonp response
      end

      def bounding_box(c)
        lat = c.map{|o| o.latitude}
        long = c.map{|o| o.longitude}
        {
          :north => lat.max,
          :south => lat.min,
          :east  => long.max,
          :west  => long.min
        }
      end

    end
  end
end
