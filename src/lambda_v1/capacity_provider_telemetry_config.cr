module Amazonite::LambdaV1
  class CapacityProviderTelemetryConfig
    include JSON::Serializable

    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : CapacityProviderLoggingConfig | Nil

    def initialize(
      @logging_config : CapacityProviderLoggingConfig | Nil = nil,
    )
    end
  end
end
