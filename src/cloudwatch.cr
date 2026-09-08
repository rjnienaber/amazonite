require "json"
require "xml"

require "./core/*"
require "./cloudwatch/*"

module Amazonite::CloudWatch
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.17"
  API_VERSION = "2010-08-01"
end
