class TestHelper
  def self.create
    TestHelper.new(ARGV[0]? != "aws")
  end

  def initialize(@use_localstack = true)
  end

  def env
    env = {
      "CRYSTAL_PATH" => "#{Crystal::PATH}:..",
    }
    env["AMAZONITE_DYNAMODB_URL"] = "http://localhost:4566" if @use_localstack
    env["AWS_PROFILE"] = "local" unless (ENV["AWS_PROFILE"]? || ENV["AWS_ACCESS_KEY_ID"]?)
    env
  end

  def test_tags
    @use_localstack ? "aws" : "localstack"
  end
end
