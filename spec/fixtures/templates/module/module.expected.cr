require "json"
require "xml"

require "./core/*"
require "./dynamodb/*"

module Amazonite::DynamoDB
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "0.23.2"
  API_VERSION = "2012-08-10"
end
