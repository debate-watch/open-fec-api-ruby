require 'spec_helper'

module OpenFecApi
  RSpec.describe Client do
    describe '#committees' do
      context 'when configured' do
        before do
          @client = OpenFecApi::Client.new('raGR4XbELamehq14HZCCK6i7LJ93U9Ftw0kZVU0M')
        end

        def request_and_print(options)
          response = @client.candidates(options)
          pp response.summary
          return response
        end

        it "is configured" do
          expect(@client.configured?)
        end

        it "returns responses" do
          response = @client.committees
          expect(response).to be_kind_of(OpenFecApi::Response)
        end

        it "accepts pagination options and avoids rate limits" do
          options = {:page => 1, :per_page => 100}
          response = request_and_print(options)
          expect(response.results_count).to eql(100)
          while response.page < response.pages && response.page < 5 do
            options.merge!({:page => response.page + 1})
            response = request_and_print(options)
          end
          expect(true)
        end

        it "accepts endpoint-specific options" do
          options = {:state => "VA"}
          response = request_and_print(options)
          expect(response.results.map{|c| c["state"]}.uniq).to eql(["VA"])
        end

        it "prevents unrecognized params from being requested" do
          unrecognized_params = {:home_planet => "Mars"}
          response = request_and_print(unrecognized_params)
          recognized_params = response.request_query
          expect(!recognized_params.keys.include?("home_planet"))
        end

        it "returns responses filtered on Committee_ID" do
          committee_id = "C00563023"
          response = committee.find_by_id(committee_id)
          expect(response.results.map{|c| c["treasurer_name"]}.uniq).to eql(["RANDI M WILLIS"])

        end
      end
    end
  end
end
