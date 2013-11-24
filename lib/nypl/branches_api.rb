require "sequel"
require "sinatra"
require "sinatra/jsonp"
require "nypl/branches_api/room"
require "nypl/branches_api/floor"
require "nypl/branches_api/location"
require "nypl/branches_api/branch"
require "nypl/branches_api/version"

module Nypl
  module BranchesApi
    class App < Sinatra::Base
      helpers Sinatra::Jsonp

      get '/' do
        branches = Nypl::BranchesApi::Branch.all 
        
        response = {
          :branches => branches.map { |b|
            b.as_resource
          },
          :box => bounding_box(branches)
        }

        jsonp response
      end

      get %r{/([A-Z]+)$} do
        abbrev = params[:captures].first
        branch = Nypl::BranchesApi::Branch.
          find(:symbol => params[:captures].first)
        if branch.nil?
          raise Sinatra::NotFound
        end
        jsonp branch.as_resource
      end

      get %r{/(([A-Z]+,)+[A-Z]+)$} do
        branches = Nypl::BranchesApi::Branch.
          where(:symbol => params[:captures].first.split(',')).all
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
