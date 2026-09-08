require "json"
require "xml"

require "./core/*"
require "./cloudwatch_logs/*"

module Amazonite::CloudWatchLogs
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.31"
  API_VERSION = "2014-03-28"
end
