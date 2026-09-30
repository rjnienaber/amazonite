require "json"
require "xml"

require "./core/*"

# Building every service's ~7,000 types is more than third-party doc hosts like
# crystaldoc.info will run, so a plain `crystal docs` (which sets the docs flag)
# documents only core and the service modules. The published docs pass the
# services/ files explicitly to get everything - see .github/workflows/docs.yml
{% unless flag?(:docs) %}
  require "../services/secrets_manager/*"
{% end %}

module Amazonite::SecretsManager
  # this service's own version in api-models-aws (gradle.properties), not
  # amazonite's shard version - upstream bumps it per model release
  VERSION     = "1.0.5"
  API_VERSION = "2017-10-17"
end
