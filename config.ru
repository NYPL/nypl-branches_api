require "sequel"
DB = Sequel.sqlite('apibranches.db')

require "nypl/branches_api"

run Nypl::BranchesApi::App