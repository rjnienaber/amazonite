class TestHelper
  def initialize
    @use_localstack = !ENV["AWS_PROFILE"]?
  end

  def env
    env = {
      "CRYSTAL_PATH" => "#{Crystal::PATH}:..",
    }
    env["AMAZONITE_DYNAMODB_URL"] = "http://localhost:4566" if @use_localstack
    env["AMAZONITE_SSM_URL"] = "http://localhost:4566" if @use_localstack
    env["AWS_PROFILE"] = "local" unless (ENV["AWS_PROFILE"]? || ENV["AWS_ACCESS_KEY_ID"]?)
    env
  end

  def test_tags
    @use_localstack ? "localstack" : "aws"
  end
end
