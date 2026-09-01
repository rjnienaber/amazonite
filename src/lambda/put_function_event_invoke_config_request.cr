private alias Core = Amazonite::Core

module Amazonite::Lambda
  class PutFunctionEventInvokeConfigRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function, version, or alias.
    #
    # **Name formats**
    #
    # - **Function name** - `my-function` (name-only), `my-function:v1` (with alias).
    #
    # - **Function ARN** - `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
    #
    # - **Partial ARN** - `123456789012:function:my-function`.
    #
    # You can append a version number or alias to any of the formats. The length constraint applies
    # only to the full ARN. If you specify only the function name, it is limited to 64 characters in
    # length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # A version number or alias name.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

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
      @function_name : String,
      @qualifier : String | Nil = nil,
      @maximum_retry_attempts : Int32 | Nil = nil,
      @maximum_event_age_in_seconds : Int32 | Nil = nil,
      @destination_config : DestinationConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:|(((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?))(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^\\$(LATEST(\\.PUBLISHED)?)|[a-zA-Z0-9-_$]+$"))
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

    def_equals_and_hash(@function_name, @qualifier, @maximum_retry_attempts, @maximum_event_age_in_seconds, @destination_config)
  end
end
