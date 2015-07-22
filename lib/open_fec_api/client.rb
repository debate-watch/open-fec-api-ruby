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

    def candidates
      self.class.get("/candidates", query: {'api_key' => @api_key})
    end
  end
end
