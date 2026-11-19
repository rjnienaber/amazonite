class TestHelper
  def initialize
    @use_localstack = !ENV["AWS_PROFILE"]?
  end

  def env
    # CI runs the integration job inside a container, where localstack is
    # reachable by its service hostname rather than localhost.
    endpoint = ENV["LOCALSTACK_URL"]? || "http://localhost:4566"
    env = {
      "CRYSTAL_PATH" => "#{Crystal::PATH}:..",
    }
    env["AMAZONITE_DYNAMODB_URL"] = endpoint if @use_localstack
    env["AMAZONITE_SSM_URL"] = endpoint if @use_localstack
    env["AMAZONITE_SQS_URL"] = endpoint if @use_localstack
    env["AMAZONITE_KMS_URL"] = endpoint if @use_localstack
    env["AMAZONITE_SECRETSMANAGER_URL"] = endpoint if @use_localstack
    env["AMAZONITE_LAMBDA_URL"] = endpoint if @use_localstack
    env["AMAZONITE_SNS_URL"] = endpoint if @use_localstack
    env["AMAZONITE_IAM_URL"] = endpoint if @use_localstack
    env["AMAZONITE_MONITORING_URL"] = endpoint if @use_localstack
    env["AMAZONITE_STS_URL"] = endpoint if @use_localstack
    env["AMAZONITE_CLOUDFORMATION_URL"] = endpoint if @use_localstack
    env["AMAZONITE_APIGATEWAY_URL"] = endpoint if @use_localstack
    env["AMAZONITE_EVENTS_URL"] = endpoint if @use_localstack
    env["AMAZONITE_LOGS_URL"] = endpoint if @use_localstack
    env["AMAZONITE_KINESIS_URL"] = endpoint if @use_localstack
    env["AMAZONITE_S3_URL"] = endpoint if @use_localstack
    env["AMAZONITE_EC2_URL"] = endpoint if @use_localstack
    env["AWS_PROFILE"] = "local" unless (ENV["AWS_PROFILE"]? || ENV["AWS_ACCESS_KEY_ID"]?)
    env
  end

  def test_tags
    @use_localstack ? "localstack" : "aws"
  end
end
