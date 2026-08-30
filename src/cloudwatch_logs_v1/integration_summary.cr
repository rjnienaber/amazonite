private alias ACWL = Amazonite::CloudWatchLogsV1

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

    def_equals_and_hash(@integration_name, @integration_type, @integration_status)
  end
end
