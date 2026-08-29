module Amazonite::SqsV1
  class UntagQueueRequest
    include JSON::Serializable

    # The URL of the queue.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # The list of tags to be removed from the specified queue.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @queue_url : String,
      @tag_keys : Array(String),
    )
    end
  end
end
