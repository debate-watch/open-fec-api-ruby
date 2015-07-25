# OpenFecApi

[![Gem Version](https://badge.fury.io/rb/open_fec_api.svg)](http://badge.fury.io/rb/open_fec_api)

A ruby wrapper for 18F's [Open FEC (Federal Elections Commission) API](https://api.open.fec.gov/).

## Installation

Add `gem 'open_fec_api'` to your application's *Gemfile* and run `bundle install`, or install manually with `gem install open_fec_api`.

## Configuration

Configure a client with your [API key](https://api.data.gov/signup/) before making requests.

```` rb
client = OpenFecApi::Client.new("api_key_123")
````

## Usage

Make a request.

```` rb
response = client.candidates
````

Request different pages by setting the `:page` request parameter. Avoid rate-limits by increasing the `:per_page` request parameter to 100.

```` rb
options = {:page => 1, :per_page => 100}
response = client.candidates(options)
while response.page < response.pages do
  options.merge!({:page => response.page + 1})
  response = client.candidates(options)
end
````

Make requests using endpoint-specific parameters.

```` rb
options = {:party => "DEM"}
response = client.candidates(options)
````

## Contributing

Help wrap all the [endpoints](ENDPOINTS.md)!

Browse existing issues or create a new issue to communicate bugs, desired features, etc.

After forking the repo and pushing your changes, create a pull request referencing the applicable issue(s).

### Installation

Check out the repo with `git clone git@github.com:debate-watch/open-fec-api-ruby.git`, and `cd open-fec-api-ruby`.

After checking out the repo, run `bin/setup` to install dependencies.

### Testing

Run `bundle exec rake` or `bundle exec rspec spec/` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

### Releasing

Update the version number in `version.rb`, then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
