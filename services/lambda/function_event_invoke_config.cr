private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @function_arn
        raise Core::ValidationError.new("FunctionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("FunctionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("FunctionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @maximum_retry_attempts
        raise Core::ValidationError.new("MaximumRetryAttempts value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaximumRetryAttempts value must be <= 2") if value > 2
      end

      if value = @maximum_event_age_in_seconds
        raise Core::ValidationError.new("MaximumEventAgeInSeconds value must be >= 60") if value < 60
        raise Core::ValidationError.new("MaximumEventAgeInSeconds value must be <= 21600") if value > 21600
      end

      if value = @destination_config
        value.validate!
      end
    end

    def_equals_and_hash(@last_modified, @function_arn, @maximum_retry_attempts, @maximum_event_age_in_seconds, @destination_config)
  end
end
