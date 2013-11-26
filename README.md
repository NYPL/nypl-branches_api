# Nypl::BranchesApi

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'nypl-branches_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nypl-branches_api

## Database

To run locally you'll need to set up a database. Load the schema and
data from the SQL files in the `data` directory

## Usage

Start the server with the command

    bundle exec rackup config.ru

The app looks for a `DATABASE_URL` environment variable to know how to
connect to its database (à la Heroku). An easy way to set this is to
prepend it to the command, e.g.

    DATABASE_URL=postgres://localhost/nypl_branches bundle exec rackup config.ru

You can then use curl or the like to retrieve the endpoints:

    curl http://localhost:9292

## Endpoints

<table>
  <tr>
    <td>All branches</td>
	<td>/</td>
	<td>http://localhost:9292/</td>
  </tr>
  <tr>
    <td>One branch</td>
	<td>/[branch abbreviation]
	<td>http://localhost:9292/SASB</td>
  </tr>
  <tr>
    <td>Multiple branches</td>
	<td>/[branch abbreviation[,branch abbreviation[,...]]]
	<td>http://localhost:9292/SASB,YV,DY</td>
  </tr>
  <tr>
    <td>By borough</td>
	<td>/borough/[bronx|manhattan|staten-island]</td>
	<td>http://localhost:9292/borough/staten-island</td>
  </tr>
</table>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
