require "spec"
require "amazonite/dynamodb_v2"

def wait_until(&check)
  counter = 0
  loop do
    break if yield

    raise Exception.new("timed out waiting for check to succeed") if counter == 20

    counter += 1
    sleep 0.5
  end
end
