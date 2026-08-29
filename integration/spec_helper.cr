require "spec"
require "amazonite/dynamodb_v2"
require "amazonite/ssm_v1"
require "amazonite/sqs_v1"
require "amazonite/kms_v1"
require "amazonite/secrets_manager_v1"
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
