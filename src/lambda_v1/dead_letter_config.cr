private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # The [dead-letter
  # queue](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-dlq)
  # for failed asynchronous invocations.
  class DeadLetterConfig
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
    @[JSON::Field(key: "TargetArn")]
    property target_arn : String | Nil

    def initialize(
      @target_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @target_arn
        raise Core::ValidationError.new("TargetArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TargetArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("TargetArn does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()$"))
      end
    end

    def_equals_and_hash(@target_arn)
  end
end
