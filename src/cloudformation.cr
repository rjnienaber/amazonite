require "json"
require "xml"

require "./core/*"
require "./cloudformation/*"

module Amazonite::CloudFormation
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.12"
  API_VERSION = "2010-05-15"
end
