module Amazonite::LambdaV1
  # Configuration settings for [durable
  # functions](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html), including
  # execution timeout, retention period for execution history, and an optional ARN of the Key
  # Management Service (KMS) customer managed key that is used to encrypt your durable execution's
  # payload data, including input, output, and error payloads.
  class DurableConfig
    include JSON::Serializable

    # The ARN of the Key Management Service (KMS) customer managed key that is used to encrypt your
    # durable execution's payload data, including input, output, and error payloads.
    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    # The number of days to retain execution history after a durable execution completes. After this
    # period, execution history is no longer available through the GetDurableExecutionHistory API.
    @[JSON::Field(key: "RetentionPeriodInDays")]
    property retention_period_in_days : Int32 | Nil

    # The maximum time (in seconds) that a durable execution can run before timing out. This timeout
    # applies to the entire durable execution, not individual function invocations.
    @[JSON::Field(key: "ExecutionTimeout")]
    property execution_timeout : Int32 | Nil

    def initialize(
      @kms_key_arn : String | Nil = nil,
      @retention_period_in_days : Int32 | Nil = nil,
      @execution_timeout : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@kms_key_arn, @retention_period_in_days, @execution_timeout)
  end
end
