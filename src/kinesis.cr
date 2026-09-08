require "json"
require "xml"

require "./core/*"
require "./kinesis/*"

module Amazonite::Kinesis
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.11"
  API_VERSION = "2013-12-02"
end
