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
          candidates = response["results"]
          expect(candidates).to be_kind_of(Array)
          expect(candidates).not_to be_empty
          expect(candidates.first).to be_kind_of(Hash)
        end

        class UnexpectedResultsError < StandardError ; end

        def request_and_print(options)
          attempt = 1
          begin
            response = @client.candidates(options)
            raise UnexpectedResultsError unless response["results"]
            binding.pry unless response["results"] && response["pagination"] && response.headers["x-ratelimit-remaining"] && response.headers["x-ratelimit-limit"]
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
          while response["pagination"]["page"].to_i < response["pagination"]["pages"].to_i  do
            options.merge!({:page => response["pagination"]["page"] + 1})
            response = request_and_print(options)
          end
          expect
        end
      end
    end
  end
end
