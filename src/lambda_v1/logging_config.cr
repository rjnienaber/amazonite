private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class LoggingConfig
    include JSON::Serializable

    @[JSON::Field(key: "LogFormat", converter: AL::LogFormat)]
    property log_format : LogFormat | Nil

    @[JSON::Field(key: "ApplicationLogLevel", converter: AL::ApplicationLogLevel)]
    property application_log_level : ApplicationLogLevel | Nil

    @[JSON::Field(key: "SystemLogLevel", converter: AL::SystemLogLevel)]
    property system_log_level : SystemLogLevel | Nil

    @[JSON::Field(key: "LogGroup")]
    property log_group : String | Nil

    def initialize(
      @log_format : LogFormat | Nil = nil,
      @application_log_level : ApplicationLogLevel | Nil = nil,
      @system_log_level : SystemLogLevel | Nil = nil,
      @log_group : String | Nil = nil,
    )
    end
  end
end
