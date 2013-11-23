require "sequel"
require "sinatra"
require "sinatra/jsonp"
require "nypl/branches_api/room"
require "nypl/branches_api/level"
require "nypl/branches_api/location"
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

      get %r{/([A-Z]+)$} do
        abbrev = params[:captures].first
        branch = Nypl::BranchesApi::Location.
          find(:symbol => params[:captures].first)
        if branch.nil?
          raise Sinatra::NotFound
        end
        jsonp Nypl::BranchesApi::Site[branch.sid].as_resource
      end

      get %r{/(([A-Z]+,)+[A-Z]+)$} do
        x = {:vector => params[:captures].first.split(',')}
        
        sids = Nypl::BranchesApi::Location.
          where(:symbol => params[:captures].first.split(',')).all.
          map{ |s| s.sid }
        branches = Nypl::BranchesApi::Site.where(:sid => sids)
        response = {
          :branches => branches.map { |s|
            s.as_resource          
          },
          :box => bounding_box(branches)
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
