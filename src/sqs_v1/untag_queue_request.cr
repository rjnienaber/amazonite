module Amazonite::SqsV1
  class UntagQueueRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String)

    def initialize(
      @queue_url : String,
      @tag_keys : Array(String),
    )
    end
  end
end
