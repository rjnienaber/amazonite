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
  end
end
