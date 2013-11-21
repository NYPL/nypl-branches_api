require "sinatra"
require "sinatra/jsonp"
require "nypl/branches_api/version"

module Nypl
  module BranchesApi
    # Your code goes here...
    class App < Sinatra::Base
      helpers Sinatra::Jsonp

      get '/' do
        response = {
          'locations' => 'hurray!'
        }

        jsonp response
      end
    end
  end
end
