private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class ListIntegrationsRequest
    include JSON::Serializable

    # To limit the results to integrations that start with a certain name prefix, specify that name
    # prefix here.
    @[JSON::Field(key: "integrationNamePrefix")]
    property integration_name_prefix : String | Nil

    # To limit the results to integrations of a certain type, specify that type here.
    @[JSON::Field(key: "integrationType", converter: ACWL::IntegrationType)]
    property integration_type : IntegrationType | Nil

    # To limit the results to integrations with a certain status, specify that status here.
    @[JSON::Field(key: "integrationStatus", converter: ACWL::IntegrationStatus)]
    property integration_status : IntegrationStatus | Nil

    def initialize(
      @integration_name_prefix : String | Nil = nil,
      @integration_type : IntegrationType | Nil = nil,
      @integration_status : IntegrationStatus | Nil = nil,
    )
    end
  end
end
