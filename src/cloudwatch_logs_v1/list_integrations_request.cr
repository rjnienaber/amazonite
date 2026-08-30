private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @integration_name_prefix
        raise Core::ValidationError.new("integrationNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("integrationNamePrefix length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("integrationNamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@integration_name_prefix, @integration_type, @integration_status)
  end
end
