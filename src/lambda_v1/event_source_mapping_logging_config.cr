private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # (Amazon MSK, and self-managed Apache Kafka only) The logging configuration for your event
  # source. Use this configuration object to define the level of logs for your event source mapping.
  class EventSourceMappingLoggingConfig
    include JSON::Serializable

    # The log level you want your event source mapping to use. Lambda event poller only sends system
    # logs at the selected level of detail and lower, where `DEBUG` is the highest level and `WARN` is
    # the lowest. For more information about these metrics, see [ Event source mapping
    # logging](https://docs.aws.amazon.com/lambda/latest/dg/esm-logging.html).
    @[JSON::Field(key: "SystemLogLevel", converter: AL::EventSourceMappingSystemLogLevel)]
    property system_log_level : EventSourceMappingSystemLogLevel | Nil

    def initialize(
      @system_log_level : EventSourceMappingSystemLogLevel | Nil = nil,
    )
    end
  end
end
