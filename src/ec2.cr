require "json"
require "xml"

require "./core/*"
require "./ec2/*"

module Amazonite::EC2
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.108"
  API_VERSION = "2016-11-15"
end
