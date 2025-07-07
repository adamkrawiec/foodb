require 'rails_helper'

RSpec.describe Themealdb::Search do
  let(:search) { "Arrabita" }
  let(:url) { "https://www.themealdb.com/api/json/v1/1/search.php" }
  let(:body) { { query: { s: search } } }
  let(:response) { Struct.new(:body).new("{}".to_json) }

  describe "#call" do
    it "performs an api call" do
      expect(Themealdb::Search).to receive(:get)
        .with(url, body)
        .and_return(response)

      Themealdb::Search.call(search)
    end
  end
end
