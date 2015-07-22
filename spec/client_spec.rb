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

        it "returns expected responses" do
          response = @client.candidates
          candidates = response["results"]
          expect(candidates).to be_kind_of(Array)
          expect(candidates).not_to be_empty
          expect(candidates.first).to be_kind_of(Hash)
        end
      end
    end
  end
end
