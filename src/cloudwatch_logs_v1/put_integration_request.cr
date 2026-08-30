private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class PutIntegrationRequest
    include JSON::Serializable

    # A name for the integration.
    @[JSON::Field(key: "integrationName")]
    property integration_name : String

    # A structure that contains configuration information for the integration that you are creating.
    @[JSON::Field(key: "resourceConfig")]
    property resource_config : ResourceConfig

    # The type of integration. Currently, the only supported type is `OPENSEARCH`.
    @[JSON::Field(key: "integrationType", converter: ACWL::IntegrationType)]
    property integration_type : IntegrationType

    def initialize(
      @integration_name : String,
      @resource_config : ResourceConfig,
      @integration_type : IntegrationType,
    )
    end
  end
end
