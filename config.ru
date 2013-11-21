require "sequel"
DB = Sequel.sqlite('locs.db')

require "nypl/branches_api"

run Nypl::BranchesApi::App