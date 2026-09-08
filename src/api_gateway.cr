require "json"
require "xml"

require "./core/*"
require "./api_gateway/*"

module Amazonite::ApiGateway
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.8"
  API_VERSION = "2015-07-09"
end
