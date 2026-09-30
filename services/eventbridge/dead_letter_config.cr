private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # Configuration details of the Amazon SQS queue for EventBridge to use as a dead-letter queue
  # (DLQ).
  #
  # For more information, see [Using dead-letter queues to process undelivered
  # events](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-rule-event-delivery.html#eb-rule-dlq)
  # in the *EventBridge User Guide*.
  class DeadLetterConfig
    include JSON::Serializable

    # The ARN of the SQS queue specified as the target for the dead-letter queue.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 1600") if value.size > 1600
      end
    end

    def_equals_and_hash(@arn)
  end
end
