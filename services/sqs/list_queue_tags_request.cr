module Amazonite::Sqs
  class ListQueueTagsRequest
    include JSON::Serializable

    # The URL of the queue.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    def initialize(
      @queue_url : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_url)
  end
end
