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

      query = {'api_key' => @api_key}
      query.merge!({'page' => page}) if page

      self.class.get("/candidates", query: query)
    end
  end
end
