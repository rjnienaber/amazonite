private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This structure contains information about one CloudWatch Logs integration. This structure is
  # returned by a
  # [ListIntegrations](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html)
  # operation.
  class IntegrationSummary
    include JSON::Serializable

    # The name of this integration.
    @[JSON::Field(key: "integrationName")]
    property integration_name : String | Nil

    # The type of integration. Integrations with OpenSearch Service have the type `OPENSEARCH`.
    @[JSON::Field(key: "integrationType", converter: ACWL::IntegrationType)]
    property integration_type : IntegrationType | Nil

    # The current status of this integration.
    @[JSON::Field(key: "integrationStatus", converter: ACWL::IntegrationStatus)]
    property integration_status : IntegrationStatus | Nil

    def initialize(
      @integration_name : String | Nil = nil,
      @integration_type : IntegrationType | Nil = nil,
      @integration_status : IntegrationStatus | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @integration_name
        raise Core::ValidationError.new("integrationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("integrationName length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("integrationName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@integration_name, @integration_type, @integration_status)
  end
end
