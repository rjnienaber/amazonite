module Amazonite::SqsV1
  class ListQueueTagsRequest
    include JSON::Serializable

    # The URL of the queue.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    def initialize(
      @queue_url : String,
    )
    end
  end
end
