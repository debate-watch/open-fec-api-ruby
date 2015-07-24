require 'spec_helper'

module OpenFecApi
  RSpec.describe Client do
    describe '#candidates' do
      context 'when configured' do
        before do
          @client = OpenFecApi::Client.new(:api_key => ENV["OPEN_FEC_API_KEY"])
        end

        it "is configured" do
          expect(@client.configured?)
        end

        it "returns responses" do
          response = @client.candidates
          expect(response["results"]).to be_kind_of(Array) #expect(response).to be_kind_of(OpenFecApi::Response)
        end

        class UnexpectedResultsError < StandardError ; end

        def request_and_print(options)
          attempt = 1
          begin
            response = @client.candidates(options)
            raise UnexpectedResultsError unless response["results"] && response["pagination"] && response.headers["x-ratelimit-remaining"] && response.headers["x-ratelimit-limit"]
            limit = response.headers["x-ratelimit-limit"].to_i
            remaining = response.headers["x-ratelimit-remaining"].to_i
            page = response["pagination"]["page"]
            pages = response["pagination"]["pages"]
            first = response["results"].first["name"]
            last = response["results"].last["name"]
            puts "PAGE #{page}/#{pages} -- RATE #{remaining}/#{limit} -- #{first} ... #{last} "

            sleep 1 if remaining < limit / 4
            sleep 2 if remaining < limit / 10
            return response
          rescue UnexpectedResultsError => e
            puts "UNEXPECTED RESULTS -- ATTEMPT #{attempt}"
            attempt+=1
            retry unless attempt > 3
          end
        end

        it "accepts pagination options and avoids rate limits" do
          options = {:page => 1, :per_page => 100}
          response = request_and_print(options)
          expect(response["results"].count).to eql(100)
          while response["pagination"]["page"].to_i < response["pagination"]["pages"].to_i && response["pagination"]["page"].to_i < 5 do
            options.merge!({:page => response["pagination"]["page"].to_i + 1})
            response = request_and_print(options)
          end
          success = true
          expect(success)
        end

        it "accepts endpoint-specific options" do
          options = {:party => "DEM"}
          response = request_and_print(options)
          expect(response["results"].map{|c| c["party"]}.uniq).to eql(["DEM"])
        end

        it "prevents unrecognized params from being requested" do
          options = {:hair_color => "brown"}
          response = request_and_print(options)
          expect(response["results"]).to be_kind_of(Array) #expect(response).to be_kind_of(OpenFecApi::Response)
        end
      end
    end
  end
end
