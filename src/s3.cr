require "json"
require "xml"

require "./core/*"
require "./s3/*"

module Amazonite::S3
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.24"
  API_VERSION = "2006-03-01"
end
