require 'httparty'

module OpenFecApi
  class Client
    include HTTParty

    base_uri 'https://api.open.fec.gov/v1'

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def configured?
      !self.api_key.nil?
    end

    def request_params
      [
        "page", "per_page", "year", "designation", "committee_type", "organization_type",
        "cycle", "party", "min_first_file_date", "candidate_id", "state", "committee_id",
        "name", "q", "max_first_file_date", "sort", "sort_hide_null", "sort_nulls_large"
      ]
    end # NOTE: these params don't apply to all available endpoints ...

    # @param [String] endpoint One of: ["candidates/","committees/"]
    # @param [Hash] options
    #   option options Array[string] :sort Provide a field to sort by. Use - for descending order.
    #   option options Boolean :sort_hide_null Hide null values on sorted column(s).
    #   option options String :year See records pertaining to a particular year.
    #   option options Array[string] :office Governmental office candidate runs for: House (H), Senate (S) or President (P).
    #   option options Array[string] :candidate_status One letter code explaining if the candidate is: present (C), future (F), not yet (N), or prior (P).
    #   option options Array[string] :party Three letter code for the party under which a candidate ran for office.
    #   option options Array[string] :state U.S. State candidate or territory where a candidate runs for office.
    #   option options Array[integer] :cycle Two-year election cycle in which a candidate runs for office. Calculated from FEC form 2.
    #   option options Array[string] :district Two digit district number.
    #   option options Array[string] :incumbent_challenge One letter code explaining if the candidate is an incumbent (I), a challenger (C), or if the seat is open (O).
    #   option options String :q Text to search all fields for.
    #   option options String :name Candidate's name (full or partial).
    #   option options Array[string] :candidate_id A unique identifier assigned to each candidate registered with the FEC. If a person runs for several offices, that person will have separate candidate IDs for each office.
    #   option options Integer :page For paginating through results, starting at page 1.
    #   option options Integer :per_page The number of results returned per page. Defaults to 20.
    #
    def get_response(endpoint, options = {})
      endpoint_name = endpoint.gsub("/","")
      request_options = options.select{|k,v| request_params.include?(k.to_s)}

      # Parse/compile query params.

      query = {'api_key' => @api_key}
      request_options.each do |k,v|
        query.merge!({k.to_s => v})
      end

      # Make a request.

      response = self.class.get(endpoint, query: query)

      # Return the proper response.

      response_class_name = endpoint_name.capitalize.concat("Response")
      return OpenFecApi.const_get(response_class_name).new(response) # response_class_name.constantize.new(response)
    end

    # Candidates Endpoint
    #
    # https://api.open.fec.gov/developers#!/candidate/get_candidates
    #
    # @example
    #   OpenFecApi::Client.new(:api_key => API_KEY).candidates(:page => 1, :per_page => 100)
    def candidates(options = {})
      get_response("/candidates", options)
    end

    # Committees Endpoint
    #
    # https://api.open.fec.gov/developers#!/committee/get_committees
    #
    # @example
    #   OpenFecApi::Client.new(:api_key => API_KEY).committees(:page => 1, :per_page => 100)
    def committees(options = {})
      get_response("/committees", options)
    end
  end
end
