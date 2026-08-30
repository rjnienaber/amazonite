private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @kms_key_arn
        raise Core::ValidationError.new("KMSKeyArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KMSKeyArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("KMSKeyArn does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()$"))
      end

      if value = @retention_period_in_days
        raise Core::ValidationError.new("RetentionPeriodInDays value must be >= 1") if value < 1
        raise Core::ValidationError.new("RetentionPeriodInDays value must be <= 90") if value > 90
      end

      if value = @execution_timeout
        raise Core::ValidationError.new("ExecutionTimeout value must be >= 1") if value < 1
        raise Core::ValidationError.new("ExecutionTimeout value must be <= 31622400") if value > 31622400
      end
    end

    def_equals_and_hash(@kms_key_arn, @retention_period_in_days, @execution_timeout)
  end
end
