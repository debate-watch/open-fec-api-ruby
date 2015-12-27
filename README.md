# OpenFecApi

[![Gem Version](https://badge.fury.io/rb/open_fec_api.svg)](http://badge.fury.io/rb/open_fec_api)

A ruby interface to the [Open Federal Elections Commission (FEC) API](https://api.open.fec.gov/). Returns data about election candidates and committees. Includes options to customize API requests.

## Installation

```` sh
gem install open_fec_api
````

## Prerequisites

Obtain an [API key](https://api.data.gov/signup/).

## Usage

```` rb
client = OpenFecApi::Client.new("api_key_123")
candidates_response = client.candidates
committees_response = client.committees
````
### Configuration Options

Request subsequent pages and avoid rate-limits.

```` rb
options = {:page => 1, :per_page => 100}
response = client.candidates(options)

while response.page < response.pages do
  options.merge!({:page => response.page + 1})
  response = client.candidates(options)
end
````

Specify endpoint-specific parameters.

```` rb
options = {:party => "DEM"}

response = client.candidates(options)
````

## Contributing

Help wrap all the [endpoints](ENDPOINTS.md)!

Browse existing issues or create a new issue to communicate bugs, desired features, etc.

After forking the repo and pushing your changes, create a pull request referencing the applicable issue(s).

### Developing

```` sh
git clone git@github.com:data-creative/open-fec-api-ruby.git
cd open-fec-api-ruby
````

Run `bin/setup` to install dependencies.

Obtain an API key and assign it to an environment variable called `OPEN_FEC_API_KEY`.

### Testing

Run `bundle exec rake` or `bundle exec rspec spec/` to run the tests.

Run `bin/console` for an interactive prompt to facilitate experiment.

Run `bundle exec rake install` to install the packaged gem onto your local machine for testing in other local projects.

### Releasing

Update the version number in `version.rb`, then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
