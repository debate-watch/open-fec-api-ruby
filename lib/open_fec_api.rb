require "open_fec_api/version"

require 'httparty'

module OpenFecApi
  BASE_URI = 'http://api.open.fec.gov/v1'
  API_KEY = ENV['OPEN_FEC_API_KEY']

  def self.config(api_key = nil)
    @api_key = api_key || API_KEY
  end

  def self.candidates_response
    HTTParty.get("#{BASE_URI}/candidates?api_key=#{@api_key}")
  end

  def self.candidates
    candidates_response["results"] || candidates_response
  end
end
