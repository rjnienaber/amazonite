require "json"
require "xml"

require "./core/*"
require "./sts/*"

module Amazonite::Sts
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.7"
  API_VERSION = "2011-06-15"
end
