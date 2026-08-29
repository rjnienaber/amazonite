private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class FunctionEventInvokeConfig
    include JSON::Serializable

    # The date and time that the configuration was last updated.
    @[JSON::Field(key: "LastModified", converter: Core::AWSEpochConverter)]
    property last_modified : Time | Nil

    # The Amazon Resource Name (ARN) of the function.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    # The maximum number of times to retry when the function returns an error.
    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    # The maximum age of a request that Lambda sends to a function for processing.
    @[JSON::Field(key: "MaximumEventAgeInSeconds")]
    property maximum_event_age_in_seconds : Int32 | Nil

    # A destination for events after they have been sent to a function for processing.
    #
    # **Destinations**
    #
    # - **Function** - The Amazon Resource Name (ARN) of a Lambda function.
    #
    # - **Queue** - The ARN of a standard SQS queue.
    #
    # - **Bucket** - The ARN of an Amazon S3 bucket.
    #
    # - **Topic** - The ARN of a standard SNS topic.
    #
    # - **Event Bus** - The ARN of an Amazon EventBridge event bus.
    #
    # S3 buckets are supported only for on-failure destinations. To retain records of successful
    # invocations, use another destination type.
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
