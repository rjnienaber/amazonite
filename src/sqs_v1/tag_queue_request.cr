module Amazonite::SqsV1
  class TagQueueRequest
    include JSON::Serializable

    # The URL of the queue.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # The list of tags to be added to the specified queue.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String)

    def initialize(
      @queue_url : String,
      @tags : Hash(String, String),
    )
    end
  end
end
