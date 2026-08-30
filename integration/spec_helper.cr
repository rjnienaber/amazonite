require "spec"
require "amazonite/dynamodb"
require "amazonite/ssm"
require "amazonite/sqs"
require "amazonite/kms"
require "amazonite/secrets_manager"
require "amazonite/lambda"
require "amazonite/sns"
require "amazonite/iam"
require "amazonite/cloudwatch"
require "amazonite/sts"
require "amazonite/cloudformation"
require "amazonite/api_gateway"
require "amazonite/eventbridge"
require "amazonite/cloudwatch_logs"
require "amazonite/kinesis"
require "./helpers"

def wait_until(&)
  counter = 0
  loop do
    break if yield

    raise Exception.new("timed out waiting for check to succeed") if counter == 20

    counter += 1
    sleep 0.5.seconds
  end
end

Log.setup_from_env
