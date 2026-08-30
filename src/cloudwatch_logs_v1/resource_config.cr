private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This structure contains configuration details about an integration between CloudWatch Logs and
  # another entity.
  class ResourceConfig
    include JSON::Serializable

    # This structure contains configuration details about an integration between CloudWatch Logs and
    # OpenSearch Service.
    @[JSON::Field(key: "openSearchResourceConfig")]
    property open_search_resource_config : OpenSearchResourceConfig | Nil

    def initialize(
      @open_search_resource_config : OpenSearchResourceConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @open_search_resource_config
        value.validate!
      end
    end

    def_equals_and_hash(@open_search_resource_config)
  end
end
