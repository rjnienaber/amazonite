private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class FunctionEventInvokeConfig
    include JSON::Serializable

    @[JSON::Field(key: "LastModified", converter: Core::AWSEpochConverter)]
    property last_modified : Time | Nil

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    @[JSON::Field(key: "MaximumEventAgeInSeconds")]
    property maximum_event_age_in_seconds : Int32 | Nil

    @[JSON::Field(key: "DestinationConfig")]
    property destination_config : DestinationConfig | Nil

    def initialize(
      @last_modified : Time | Nil = nil,
      @function_arn : String | Nil = nil,
      @maximum_retry_attempts : Int32 | Nil = nil,
      @maximum_event_age_in_seconds : Int32 | Nil = nil,
      @destination_config : DestinationConfig | Nil = nil,
    )
    end
  end
end
