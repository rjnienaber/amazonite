module Amazonite::LambdaV1
  # Configuration that specifies the telemetry collection for the capacity provider.
  class CapacityProviderTelemetryConfig
    include JSON::Serializable

    # The capacity provider's Amazon CloudWatch Logs configuration settings.
    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : CapacityProviderLoggingConfig | Nil

    def initialize(
      @logging_config : CapacityProviderLoggingConfig | Nil = nil,
    )
    end

    def_equals_and_hash(@logging_config)
  end
end
