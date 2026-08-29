private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class EventSourceMappingLoggingConfig
    include JSON::Serializable

    @[JSON::Field(key: "SystemLogLevel", converter: AL::EventSourceMappingSystemLogLevel)]
    property system_log_level : EventSourceMappingSystemLogLevel | Nil

    def initialize(
      @system_log_level : EventSourceMappingSystemLogLevel | Nil = nil,
    )
    end
  end
end
