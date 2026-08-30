private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class GetIntegrationResponse
    include JSON::Serializable

    # The name of the integration.
    @[JSON::Field(key: "integrationName")]
    property integration_name : String | Nil

    # The type of integration. Integrations with OpenSearch Service have the type `OPENSEARCH`.
    @[JSON::Field(key: "integrationType", converter: ACWL::IntegrationType)]
    property integration_type : IntegrationType | Nil

    # The current status of this integration.
    @[JSON::Field(key: "integrationStatus", converter: ACWL::IntegrationStatus)]
    property integration_status : IntegrationStatus | Nil

    # A structure that contains information about the integration configuration. For an integration
    # with OpenSearch Service, this includes information about OpenSearch Service resources such as
    # the collection, the workspace, and policies.
    @[JSON::Field(key: "integrationDetails")]
    property integration_details : IntegrationDetails | Nil

    def initialize(
      @integration_name : String | Nil = nil,
      @integration_type : IntegrationType | Nil = nil,
      @integration_status : IntegrationStatus | Nil = nil,
      @integration_details : IntegrationDetails | Nil = nil,
    )
    end
  end
end
