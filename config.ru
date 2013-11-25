require "sequel"

# Open an in-memory DB
DB = Sequel.sqlite

# Populate database
cwd = File.dirname(__FILE__)
structure = File.open(File.join(cwd, 'data', 'schema-sqlite.sql'), 'r').read
DB.execute_ddl(structure)
contents = File.open(File.join(cwd, 'data', 'branches.sql'), 'r').read
DB.execute_dui(contents)

require "nypl/branches_api"

run Nypl::BranchesApi::App