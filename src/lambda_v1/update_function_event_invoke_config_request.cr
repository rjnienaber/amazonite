module Amazonite::LambdaV1
  class UpdateFunctionEventInvokeConfigRequest
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

    def_equals_and_hash(@function_name, @qualifier, @maximum_retry_attempts, @maximum_event_age_in_seconds, @destination_config)
  end
end
