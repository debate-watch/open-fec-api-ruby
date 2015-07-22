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

        it "accepts pagination options" do
          options = {:page => 1}

          # start
          response = @client.candidates(options)
          binding.pry unless response["results"] && response["pagination"]
          pp "PAGE #{response["pagination"]["page"]} OF #{response["pagination"]["pages"]}", response["results"].first
          # end

          while response["pagination"]["page"] < response["pagination"]["pages"]  do
            options.merge!({:page => response["pagination"]["page"] + 1})

            # start
            response = @client.candidates(options)
            binding.pry unless response["results"] && response["pagination"]
            pp "PAGE #{response["pagination"]["page"]} OF #{response["pagination"]["pages"]}", response["results"].first
            # end
          end
        end
      end
    end
  end
end
