require "open_fec_api/version"
require "open_fec_api/client"

module OpenFecApi
=begin

  #
  # CANDIDATE
  #

  GET /candidate/{candidate_id}
  GET /candidate/{candidate_id}/history
  GET /candidate/{candidate_id}/history/{cycle}

  #
  # CANDIDATES
  #

  GET /candidates
  GET /candidates/search

  GET /committee/{committee_id}/candidates
  GET /committee/{committee_id}/candidates/history
  GET /committee/{committee_id}/candidates/history/{cycle}

  #
  # COMMITTEE
  #

  GET /committee/{committee_id}
  GET /committee/{committee_id}/filings
  GET /committee/{committee_id}/reports
  GET /committee/{committee_id}/totals
  GET /committee/{committee_id}/history
  GET /committee/{committee_id}/history/{cycle}

  #
  # COMMITTEES
  #

  GET /committees

  GET /candidate/{candidate_id}/committees
  GET /candidate/{candidate_id}/committees/history
  GET /candidate/{candidate_id}/committees/history/{cycle}

  #
  # SCHEDULES
  #

  GET /schedules/schedule_a
  GET /schedules/schedule_a/by_contributor
  GET /schedules/schedule_a/by_size
  GET /schedules/schedule_a/by_state
  GET /schedules/schedule_a/by_zip
  GET /schedules/schedule_b

  GET /committee/{committee_id}/schedules/schedule_a/by_contributor
  GET /committee/{committee_id}/schedules/schedule_a/by_size
  GET /committee/{committee_id}/schedules/schedule_a/by_state
  GET /committee/{committee_id}/schedules/schedule_a/by_zip

  # NAMES

  GET /names/candidates
  GET /names/committees

  HTTParty.get("http://api.open.fec.gov/v1/names/candidates?api_key=#{@api_key}")
  HTTParty.get("http://api.open.fec.gov/v1/names/committees?api_key=#{@api_key}")

  # FILINGS

  GET /filings

  # REPORTS

  GET /reports/{committee_type}

=end
end
