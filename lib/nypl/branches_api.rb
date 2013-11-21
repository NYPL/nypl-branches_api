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
        response = Nypl::BranchesApi::Site.all.map { |s|
          { 
            :id => s[:sid],
            :name => s[:name],
            :address => s[:address],
            :lat => s[:latitude],
            :long => s[:longitude]
          }
        }

        jsonp response
      end
    end
  end
end
