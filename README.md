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

Obtain an [API key](https://api.data.gov/signup/) and use it to configure the gem for usage.

```` rb
OpenFecApi.configure(api_key_string)
````

## Usage

### Endpoints

This gem wraps some, but not all API endpoints. Check the [API documentation](https://api.open.fec.gov/developers) for a list of all available endpoints, and feel free to help implement further coverage.

Endpoint | Operation | Wrapper Method
--- | --- | ---
Candidates | `GET /candidate/{candidate_id}` | `Candidate#find`
Candidates | `GET /candidate/{candidate_id}/history` | N/A
Candidates | `GET /candidate/{candidate_id}/history/{cycle}` | N/A
Candidates | `GET /candidates` | `Candidate#all`
Candidates | `GET /candidates/search` | N/A
Candidates | `GET /candidate/{candidate_id}/committees` | N/A
Candidates | `GET /candidate/{candidate_id}/committees/history` | N/A
Candidates | `GET /candidate/{candidate_id}/committees/history/{cycle}` | N/A
Committees | `GET /committee/{committee_id}/candidates` | N/A
Committees | `GET /committee/{committee_id}/candidates/history` | N/A
Committees | `GET /committee/{committee_id}/candidates/history/{cycle}` | N/A
Committees | `GET /committee/{committee_id}` | N/A
Committees | `GET /committee/{committee_id}/history` | N/A
Committees | `GET /committee/{committee_id}/history/{cycle}` | N/A
Committees | `GET /committees` | N/A
Filings | `GET /committee/{committee_id}/filings` | N/A
Filings | `GET /filings` | N/A
Financial | `GET /committee/{committee_id}/reports` | N/A
Financial | `GET /committee/{committee_id}/totals` | N/A
Financial | `GET /reports/{committee_type}` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_contributor` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_size` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_state` | N/A
Schedules | `GET /committee/{committee_id}/schedules/schedule_a/by_zip` | N/A
Schedules | `GET /schedules/schedule_a` | N/A
Schedules | `GET /schedules/schedule_a/by_contributor` | N/A
Schedules | `GET /schedules/schedule_a/by_size` | N/A
Schedules | `GET /schedules/schedule_a/by_state` | N/A
Schedules | `GET /schedules/schedule_a/by_zip` | N/A
Schedules | `GET /schedules/schedule_b` | N/A
Search | `GET /names/candidates` | `Candidate#where`
Search | `GET /names/committees` | N/A

#### Candidates

List, filter, and find candidates.

```` rb
candidates = OpenFecApi::Candidate.all
candidates = OpenFecApi::Candidate.where(:name => "Smith")
candidate = OpenFecApi::Candidate.find("P00003392")
````

### Responses

Each response returns either a Hash object, or an Array of Hash objects.

## Contributing

Help wrap all the endpoints!

1. Fork it ( https://github.com/debate-watch/open_fec_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
