require 'httparty'

module OpenFecApi
  class Client
    attr_reader :api_key
    include HTTParty
    base_uri 'https://api.open.fec.gov/v1'

    def initialize(options = {})
      @api_key = options[:api_key]
    end

    def configured?
      !self.api_key.nil?
    end

    def candidates(options = {})
      page = options[:page]
      per_page = options[:per_page]

      query = {'api_key' => @api_key}
      query.merge!({'page' => page}) if page
      query.merge!({'per_page' => per_page}) if per_page

      self.class.get("/candidates", query: query)
    end
  end
end
