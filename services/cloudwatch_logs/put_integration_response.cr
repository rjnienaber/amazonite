private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @integration_name
        raise Core::ValidationError.new("integrationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("integrationName length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("integrationName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@integration_name, @integration_status)
  end
end
