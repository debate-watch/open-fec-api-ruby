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

1. Fork it ( https://github.com/debate-watch/open_fec_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
