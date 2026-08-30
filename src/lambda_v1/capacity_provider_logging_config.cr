private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # The capacity provider's Amazon CloudWatch Logs configuration settings.
  class CapacityProviderLoggingConfig
    include JSON::Serializable

    # Set this property to filter the system logs for your capacity provider that Lambda sends to
    # CloudWatch. Lambda only sends system logs at the selected level of detail and lower, where
    # `DEBUG` is the highest level and `WARN` is the lowest.
    @[JSON::Field(key: "SystemLogLevel", converter: AL::SystemLogLevel)]
    property system_log_level : SystemLogLevel | Nil

    # The name of the Amazon CloudWatch log group the capacity provider sends logs to. By default,
    # Lambda capacity providers send logs to a default log group named
    # `/aws/lambda/capacity-provider/<capacity provider name>`. To use a different log group, enter an
    # existing log group or enter a new log group name.
    @[JSON::Field(key: "LogGroup")]
    property log_group : String | Nil

    def initialize(
      @system_log_level : SystemLogLevel | Nil = nil,
      @log_group : String | Nil = nil,
    )
    end

    def_equals_and_hash(@system_log_level, @log_group)
  end
end
