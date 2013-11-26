require "pg"
require "sequel"

DB = Sequel.connect(ENV['DATABASE_URL'])

require "nypl/branches_api"

run Nypl::BranchesApi::App