module Amazonite::SqsV1
  # Returns the `QueueUrl` attribute of the created queue.
  class CreateQueueResult
    include JSON::Serializable

    # The URL of the created Amazon SQS queue.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String | Nil

    def initialize(
      @queue_url : String | Nil = nil,
    )
    end
  end
end
