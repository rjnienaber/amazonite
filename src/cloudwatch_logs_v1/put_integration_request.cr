private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @integration_name
        raise Core::ValidationError.new("integrationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("integrationName length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("integrationName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @resource_config
        value.validate!
      end
    end

    def_equals_and_hash(@integration_name, @resource_config, @integration_type)
  end
end
