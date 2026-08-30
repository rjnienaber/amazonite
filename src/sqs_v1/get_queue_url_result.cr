module Amazonite::SqsV1
  # For more information, see [Interpreting
  # Responses](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-api-responses.html)
  # in the *Amazon SQS Developer Guide*.
  class GetQueueUrlResult
    include JSON::Serializable

    # The URL of the queue.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String | Nil

    def initialize(
      @queue_url : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_url)
  end
end
