module Amazonite::LambdaV1
  class UpdateFunctionEventInvokeConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    @[JSON::Field(key: "MaximumEventAgeInSeconds")]
    property maximum_event_age_in_seconds : Int32 | Nil

    @[JSON::Field(key: "DestinationConfig")]
    property destination_config : DestinationConfig | Nil

    def initialize(
      @function_name : String,
      @qualifier : String | Nil = nil,
      @maximum_retry_attempts : Int32 | Nil = nil,
      @maximum_event_age_in_seconds : Int32 | Nil = nil,
      @destination_config : DestinationConfig | Nil = nil,
    )
    end
  end
end
