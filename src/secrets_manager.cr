require "json"
require "xml"

require "./core/*"
require "./secrets_manager/*"

module Amazonite::SecretsManager
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.5"
  API_VERSION = "2017-10-17"
end
