private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class PutIntegrationResponse
    include JSON::Serializable

    # The name of the integration that you just created.
    @[JSON::Field(key: "integrationName")]
    property integration_name : String | Nil

    # The status of the integration that you just created.
    #
    # After you create an integration, it takes a few minutes to complete. During this time, you'll
    # see the status as `PROVISIONING`.
    @[JSON::Field(key: "integrationStatus", converter: ACWL::IntegrationStatus)]
    property integration_status : IntegrationStatus | Nil

    def initialize(
      @integration_name : String | Nil = nil,
      @integration_status : IntegrationStatus | Nil = nil,
    )
    end

    def_equals_and_hash(@integration_name, @integration_status)
  end
end
