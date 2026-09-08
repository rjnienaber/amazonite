require "json"
require "xml"

require "./core/*"
require "./lambda/*"

module Amazonite::Lambda
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.29"
  API_VERSION = "2015-03-31"
end
