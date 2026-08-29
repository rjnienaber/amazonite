module Amazonite::EventBridgeV1
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
  end
end
