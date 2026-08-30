private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # The function's Amazon CloudWatch Logs configuration settings.
  class LoggingConfig
    include JSON::Serializable

    # The format in which Lambda sends your function's application and system logs to CloudWatch.
    # Select between plain text and structured JSON.
    @[JSON::Field(key: "LogFormat", converter: AL::LogFormat)]
    property log_format : LogFormat | Nil

    # Set this property to filter the application logs for your function that Lambda sends to
    # CloudWatch. Lambda only sends application logs at the selected level of detail and lower, where
    # `TRACE` is the highest level and `FATAL` is the lowest.
    @[JSON::Field(key: "ApplicationLogLevel", converter: AL::ApplicationLogLevel)]
    property application_log_level : ApplicationLogLevel | Nil

    # Set this property to filter the system logs for your function that Lambda sends to CloudWatch.
    # Lambda only sends system logs at the selected level of detail and lower, where `DEBUG` is the
    # highest level and `WARN` is the lowest.
    @[JSON::Field(key: "SystemLogLevel", converter: AL::SystemLogLevel)]
    property system_log_level : SystemLogLevel | Nil

    # The name of the Amazon CloudWatch log group the function sends logs to. By default, Lambda
    # functions send logs to a default log group named `/aws/lambda/<function name>`. To use a
    # different log group, enter an existing log group or enter a new log group name.
    @[JSON::Field(key: "LogGroup")]
    property log_group : String | Nil

    def initialize(
      @log_format : LogFormat | Nil = nil,
      @application_log_level : ApplicationLogLevel | Nil = nil,
      @system_log_level : SystemLogLevel | Nil = nil,
      @log_group : String | Nil = nil,
    )
    end

    def_equals_and_hash(@log_format, @application_log_level, @system_log_level, @log_group)
  end
end
