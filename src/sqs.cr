require "json"
require "xml"

require "./core/*"
require "./sqs/*"

module Amazonite::Sqs
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.6"
  API_VERSION = "2012-11-05"
end
