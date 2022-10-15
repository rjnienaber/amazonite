require "../spec_helper"

class HashFetcher < Amazonite::Core::Config::Fetcher
  def initialize(@hash : Hash(String, String))
  end

  def []?(key)
    @hash[key]?
  end
end

describe Amazonite::Core::Config do
  described_class = Amazonite::Core::Config

  describe "#endpoint_url" do
    it "defaults to localstack for now" do
      Amazonite::Core::Config.new.endpoint_url("DynamoDB").should eq("http://localhost:4566")
    end

    it "use environment variable if set" do
      env = {"AMAZONITE_DYNAMODB_URL" => "https://dynamodb.com"}
      config = Amazonite::Core::Config.new(HashFetcher.new(env))
      config.endpoint_url("DynamoDB").should eq("https://dynamodb.com")
    end
  end
end
