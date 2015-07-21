# OpenFecApi

A ruby wrapper for 18F's [Open FEC (Federal Elections Commission) API](https://api.open.fec.gov/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_fec_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_fec_api

## Configuration

Configure the gem with your [API key](https://api.data.gov/signup/) before making any requests.

```` rb
OpenFecApi.config("api_key_123")
````

## Usage

List, filter, and find candidates.

```` rb
candidates = OpenFecApi::Candidate.all
candidates = OpenFecApi::Candidate.where(:name => "Smith")
candidate = OpenFecApi::Candidate.find("P00003392")
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
