=begin
module OpenFecApi
  class Endpoint
    ENDPOINTS = [
      {
        :path => "/candidates",
        :request_params => [
          "page", "per_page", "year", "designation", "committee_type", "organization_type", "cycle", "party", "min_first_file_date", "candidate_id", "state", "committee_id", "name", "q", "max_first_file_date", "sort", "sort_hide_null", "sort_nulls_large"
          # TODO: {:name => "page"}, {:name => "per_page"}
        ]
      },
      {
        :path => "/committees",
        :request_params => [
          "page", "per_page", "year", "designation", "committee_type", "organization_type", "cycle", "party", "min_first_file_date", "candidate_id", "state", "committee_id", "name", "q", "max_first_file_date", "sort", "sort_hide_null", "sort_nulls_large"
          # TODO: {:name => "page"}, {:name => "per_page"}
        ]
      }
    ]

    attr_accessor :request_params

    def initialize(options = {})
      @request_params = options[:request_params]
    end
  end
end
=end
