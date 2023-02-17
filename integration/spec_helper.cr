require "spec"
require "amazonite/dynamodb_v2"
require "amazonite/ssm_v1"
require "./helpers"

def wait_until(&)
  counter = 0
  loop do
    break if yield

    raise Exception.new("timed out waiting for check to succeed") if counter == 20

    counter += 1
    sleep 0.5
  end
end

Log.setup_from_env
