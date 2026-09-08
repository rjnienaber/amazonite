require "json"
require "xml"

require "./core/*"
require "./sns/*"

module Amazonite::Sns
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.4"
  API_VERSION = "2010-03-31"
end
