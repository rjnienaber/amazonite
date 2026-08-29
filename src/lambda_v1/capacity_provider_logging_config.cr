private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class CapacityProviderLoggingConfig
    include JSON::Serializable

    @[JSON::Field(key: "SystemLogLevel", converter: AL::SystemLogLevel)]
    property system_log_level : SystemLogLevel | Nil

    @[JSON::Field(key: "LogGroup")]
    property log_group : String | Nil

    def initialize(
      @system_log_level : SystemLogLevel | Nil = nil,
      @log_group : String | Nil = nil,
    )
    end
  end
end
